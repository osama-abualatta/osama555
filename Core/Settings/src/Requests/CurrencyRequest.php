<?php

namespace Core\Settings\Requests;

use App\Image;
use Illuminate\Foundation\Http\FormRequest;

class CurrencyRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return auth(SUPER_ADMIN_GUARD)->check();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [];
        foreach (locales() as $i => $locale) {
            $rules['name.' . $locale] = 'required_without_all:' . attributesByLocale('name', $locale) . ',' . null;
        }

        return $rules;
    }




}
