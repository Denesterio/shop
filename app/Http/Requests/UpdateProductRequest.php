<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Illuminate\Http\Request;
use App\Models\Product;

class UpdateProductRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return Auth::user()->admin;
    }

    /**
     * Подготовить данные для валидации.
     *
     * @return void
     */
    protected function prepareForValidation()
    {
        $this->merge([
            'authors' => json_decode($this->authors),
            'tags' => json_decode($this->tags),
        ]);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(Request $request)
    {
        $product = Product::find($request['id']);
        $currentYear = date('Y');
        return [
            'title' => ['required', 'string', 'max:255', Rule::unique('products')->ignore($product)],
            'subcategorySlug' => ['required', 'string', 'max:255', 'exists:subcategories,slug'],
            'description' => ['required', 'string'],
            'price' => ['required', 'integer'],
            'cover' => ['required', 'integer'],
            'year' => ['required', 'integer', 'digits:4', "between:1900,{$currentYear}"],
            'pages' => ['required', 'integer'],
            'picture' => ['nullable'],
            'images' => ['nullable'],
            'authors' => ['required', 'array'],
            'authors.*.title' => ['required', 'distinct', 'exists:authors,title'],
            'tags' => ['required', 'array'],
            'tags.*' => ['required', 'distinct', 'exists:tags,id'],
        ];
    }
}
