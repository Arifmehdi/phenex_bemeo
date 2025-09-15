@aware(['page'])
<section class="sec-pad-top sec-pad-bottom contact-one">
    <div class="container">
        <div class="row gutter-y-60">
            <h2 class="mb-5 text-center fw-bold" style="color: var(--paroti-base, #df5311);">Membership Form</h2>

            <!-- Alert Message -->
            <div id="formAlert" class="alert d-none" role="alert"></div>

            <form id="membershipForm" class="contact-one__form">
                <div class="row">
                    <div class="mb-3">
                        <label class="form-label">Name Of Unit / Company *</label>
                        <input type="text" name="company_name" class="form-control" placeholder="Enter company name"
                            required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Proprietor *</label>
                        <input type="text" name="proprietor" class="form-control" placeholder="Enter proprietor name"
                            required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Nominated Director / Partner (If any)</label>
                        <input type="text" name="nominated_director" class="form-control"
                            placeholder="Enter director/partner name">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <input type="text" name="address" class="form-control" placeholder="Enter address">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Tel *</label>
                        <input type="text" name="telephone" class="form-control" placeholder="Enter phone number"
                            required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">State / Province / Region</label>
                        <input type="text" name="state" class="form-control" placeholder="Enter state or region">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">ZIP / Postal Code *</label>
                        <input type="text" name="zip" class="form-control" placeholder="Enter ZIP code" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" style="font-weight: 600; font-size: 20px;">Factory Address *</label>
                        <input type="text" name="factory_address" class="form-control"
                            placeholder="Enter factory address" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Street Address</label>
                        <input type="text" name="street_address" class="form-control"
                            placeholder="Enter street address">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Address Line 2</label>
                        <input type="text" name="address_line_2" class="form-control"
                            placeholder="Enter address line 2">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">City</label>
                        <input type="text" name="city" class="form-control" placeholder="Enter city">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">State / Province / Region *</label>
                        <input type="text" name="factory_state" class="form-control"
                            placeholder="Enter state or region" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">ZIP / Postal Code</label>
                        <input type="text" name="factory_zip" class="form-control" placeholder="Enter postal code">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Sister Concerned Units/Group/Companies</label>
                        <textarea class="form-control" name="sister_concerns" rows="2" placeholder="Enter any related units or companies"></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Any Details/Remarks</label>
                        <textarea class="form-control" name="remarks" rows="2" placeholder="Enter additional remarks"></textarea>
                    </div>
                    <div class="col-md-12">
                        <button type="submit" class="thm-btn contact-one__btn"><span>Send message</span></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<script>
    document.getElementById('membershipForm').addEventListener('submit', async function(e) {
        e.preventDefault();

        const form = e.target;
        const formData = new FormData(form);
        const alertBox = document.getElementById('formAlert');

        try {
            const response = await fetch('/submit-membership', {
                method: 'POST',
                body: formData,
            });

            const result = await response.json();

            if (response.ok) {
                alertBox.classList.remove('d-none', 'alert-danger');
                alertBox.classList.add('alert-success');
                alertBox.innerText = result.message || 'Form submitted successfully!';
                form.reset();
            } else {
                alertBox.classList.remove('d-none', 'alert-success');
                alertBox.classList.add('alert-danger');
                alertBox.innerText = result.message || 'Something went wrong!';
            }
        } catch (error) {
            alertBox.classList.remove('d-none', 'alert-success');
            alertBox.classList.add('alert-danger');
            alertBox.innerText = 'Error submitting form. Please try again.';
        }
    });
</script>
