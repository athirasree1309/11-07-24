<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Brand Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center mb-4">Add Brand</h2>
                <form id="brandForm" action="addBrandAction.jsp" method="POST" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="brandName">Brand Name</label>
                        <input type="text" class="form-control" id="brandName" name="brandName" >
                        <div class="invalid-feedback">Please provide a valid brand name (3-50 characters).</div>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
    <!-- JavaScript validation -->
    <script>
        function validateForm() {
            var brandName = document.getElementById('brandName').value.trim();
            var brandNameInput = document.getElementById('brandName');

            // Reset previous validation state
            brandNameInput.classList.remove('is-invalid');

            if (brandName === '') {
                alert('Brand Name cannot be empty.');
                brandNameInput.classList.add('is-invalid');
                brandNameInput.focus();
                return false;
            }

            if (brandName.charAt(0) !== brandName.charAt(0).toUpperCase()) {
                alert('Product name should start with an uppercase letter.');
                document.getElementById('brandName').focus();
                return false;
            }


            return true;
        }
    </script>
    <!-- Bootstrap JS (optional) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
