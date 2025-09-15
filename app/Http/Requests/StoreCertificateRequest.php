<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreCertificateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'company_name' => 'required|string|max:255',
            'proprietor' => 'required|string|max:255',
            'director_partner' => 'nullable|string|max:255',
            'address' => 'required|string',
            'telephone' => 'nullable|string|max:20',
            'mobile' => 'nullable|string|max:20',
            'fax' => 'required|string|max:20',
            'email' => 'required|email|max:255',
            'number_of_machines' => 'required|integer|min:1',
            'brand' => 'nullable|string|max:255',
            'total_head' => 'nullable|string|max:255',
            'needle_colors' => 'nullable|string|max:255',
            'yearly_subscription' => 'required|integer|min:0',
            'receipt_no' => 'nullable|string|max:255',
            'payment_date' => 'required|date',
            'subscription_year' => 'nullable|string|max:50',
            'sister_units' => 'nullable|string',
            'remarks' => 'nullable|string',
        ];
    }
}
