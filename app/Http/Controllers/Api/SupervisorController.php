<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Ability;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class SupervisorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $supervisors = User::whereHas("roles", function ($query) {
            $query->where('name', 'supervisor');
        })->get();

        return response()->json(['supervisors' => $supervisors]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255',
            'phone' => 'required',
            'address' => 'required',
            'password' => ''
        ]);

        //$user = User::create($data);
        $user = new User;
        $user->email = $request->email;
        $user->name = $request->name;
        $user->password = Hash::make($request->password);
        $user->phone = $request->phone;
        $user->address = $request->address;
        $user->save();

        $user->assignRole("supervisor");

        if ($request->has('abilities')) {
            $user->allowTo($request->abilities);
        } else {
            $user->abilities()->delete();
        }

        return response()->json(['message' => 'User Created Successfully..!']);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::findOrFail($id);

        return response()->json(['supervisor' => $user]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::findOrFail($id);

        $userAbilities = $user->abilities->flatten()->pluck('id')->map(function ($key, $val) {
            return $key;
        });

        $abilities = Ability::all('id')->map(function ($key, $val) {
            return $key['id'];
        });


        return response()->json(['supervisor' => $user, 'abilities' => $abilities, 'userAbilities' => $userAbilities]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255',
            'phone' => '',
            'address' => '',
            'password' => ''
        ]);

        $user = User::findOrFail($id);

        DB::update('update users set name = ? , email = ? , phone = ? , address = ? where id = ?', [$request->name, $request->email, $request->phone, $request->address, $id]);

        if ($request->has('abilities')) {
            $user->allowTo($request->abilities);
        } else {
            $user->abilities()->delete();
        }

        if($request->has('password')){
            $user->password = Hash::make($request->password);
            $user->save();
        }

        return response()->json(['message' => 'User updated Successfully..!']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user = User::findOrFail($id);

        $user->delete();

    }
}
