<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [

            'title' => "required|min:10|max:100",
            'description' => "required|min:5|max:1000",
            'price' => "required",
            'quantity'=> "required",
            'category_id' => "required",
            'brand_id'   => "required"
        ];
    }
}
