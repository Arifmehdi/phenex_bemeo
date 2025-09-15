@aware(['page'])
<section class="sec-pad-top sec-pad-bottom contact-one">
    <div class="container">
        <div class="row gutter-y-60">
            <h2 class="mb-5 text-center fw-bold" style="color: var(--paroti-base, #df5311);">Request Certificate</h2>

            <!-- Alert Message -->
            <div id="formAlert" class="alert d-none" role="alert"></div>

            <form id="certificateRequestForm" class="contact-one__form">
                <div class="p-4 mb-5 border rounded row">
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Name of Unit/Company</label>
                        <input type="text" name="company_name" class="form-control"
                            placeholder="Enter Unit/Company Name" required>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Proprietor</label>
                        <input type="text" name="proprietor" class="form-control" placeholder="Enter Proprietor Name"
                            required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Nominated Director/Partner (If any)</label>
                        <input type="text" name="director_partner" class="form-control"
                            placeholder="Enter Nominated Director/Partner (if any)">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <textarea name="address" class="form-control" placeholder="Enter Address" rows="2" required></textarea>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Telephone</label>
                        <input type="text" name="telephone" class="form-control"
                            placeholder="Enter Telephone Number">
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Mobile</label>
                        <input type="text" name="mobile" class="form-control" placeholder="Enter Mobile Number">
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Fax</label>
                        <input type="text" name="fax" class="form-control" placeholder="Enter Fax Number"
                            required>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">E-mail</label>
                        <input type="email" name="email" class="form-control" placeholder="Enter Email Address"
                            required>
                    </div>
                </div>

                <div class="p-4 mb-5 border rounded row">
                    <div class="mb-3">
                        <label class="form-label">Number of Machines</label>
                        <input type="number" name="number_of_machines" class="form-control"
                            placeholder="Enter Number of Machines" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Brand</label>
                        <input type="text" name="brand" class="form-control" placeholder="Enter Machine Brand">
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Total Head</label>
                        <input type="text" name="total_head" class="form-control" placeholder="Enter Total Head">
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Needle/Colors</label>
                        <input type="text" name="needle_colors" class="form-control"
                            placeholder="Enter Needle/Colors">
                    </div>
                </div>

                <div class="p-4 mb-5 border rounded row">
                    <div class="mb-3">
                        <label class="form-label">Yearly Subscription to BEMEA (Tk)</label>
                        <input type="number" name="yearly_subscription" class="form-control"
                            placeholder="Enter BEMEA Subscription Amount" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Receipt No</label>
                        <input type="text" name="receipt_no" class="form-control" placeholder="Enter Receipt No">
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">Date</label>
                        <input type="date" name="payment_date" class="form-control" required>
                    </div>
                    <div class="mb-3 col-md-6">
                        <label class="form-label">For The Year</label>
                        <input type="text" name="subscription_year" class="form-control"
                            placeholder="Enter Year (e.g. 2025)">
                    </div>
                </div>

                <p class="mb-3 fw-bold" style="color: var(--paroti-base, #df5311);">(Note: Please make up-to-date
                    payment to BEMEA fees. This is compulsory for printing your factory details in Yearly Directory)</p>

                <div class="mb-3">
                    <label class="form-label">Sister Concerned Units/Group/Companies</label>
                    <textarea name="sister_units" class="form-control" placeholder="Enter Sister Concerned Units/Group/Companies"
                        rows="2"></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Any Details/Remarks</label>
                    <textarea name="remarks" class="form-control" placeholder="Enter Additional Details or Remarks" rows="2"></textarea>
                </div>
                <div class="col-md-12">
                    <button type="submit" class="thm-btn contact-one__btn"><span>Send message</span></button>
                </div>
            </form>
        </div>
    </div>
</section>

<script>
    document.getElementById('certificateRequestForm').addEventListener('submit', async function(e) {
        e.preventDefault();

        const form = e.target;
        const formData = new FormData(form);
        const alertBox = document.getElementById('formAlert');

        try {
            const response = await fetch("{{ route('certificate-request.store') }}", {
                method: "POST",
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}',
                    'Accept': 'application/json'
                },
                body: formData
            });

            const result = await response.json();

            if (response.ok) {
                alertBox.className = "alert alert-success";
                alertBox.textContent = "Your request has been submitted successfully!";
                alertBox.classList.remove("d-none");
                form.reset();
                form.style.display = 'none';
            } else {
                alertBox.className = "alert alert-danger";
                alertBox.textContent = result.message || "Something went wrong!";
                alertBox.classList.remove("d-none");
            }
        } catch (error) {
            alertBox.className = "alert alert-danger";
            alertBox.textContent = "Network error or server not responding!";
            alertBox.classList.remove("d-none");
            console.log(error);
            
        }
    });
</script>
