function showError(el, msg){
            el.classList.add('invalid');
            var err = document.getElementById(el.id + 'Err');
            if(err){ err.textContent = msg; err.style.display = 'block'; }
        }
        function clearError(el){
            el.classList.remove('invalid');
            var err = document.getElementById(el.id + 'Err');
            if(err){ err.style.display = 'none'; }
        }

        function validateForm(){
            var form = document.getElementById('regForm');
            var name = document.getElementById('name');
            var mobile = document.getElementById('mobile');
            var city = document.getElementById('city');
            var address = document.getElementById('address');
            var email = document.getElementById('email');
            var valid = true;

            var nameVal = name.value.trim();
            if(!/^[A-Za-z ]{2,}$/.test(nameVal)){
                showError(name, 'Please enter a valid name (letters and spaces only).');
                if(valid) name.focus();
                valid = false;
            } 
            else { 
                clearError(name); 
            }

            var mobVal = mobile.value.replace(/\s+/g,'');
            if(!/^\d{10}$/.test(mobVal)){
                showError(mobile, 'Please enter a valid 10-digit mobile number.');
                if(valid) mobile.focus();
                valid = false;
            } 
            else { 
                clearError(mobile); 
            }

            if(city.value.trim().length === 0){
                showError(city, 'Please enter your city.');
                if(valid) city.focus();
                valid = false;
            } 
            else { 
                clearError(city); 
            }

            if(address.value.trim().length === 0){
                showError(address, 'Please enter your address.');
                if(valid) address.focus();
                valid = false;
            } 
            else { 
                clearError(address); 
            }

            var emailVal = email.value.trim();
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if(!emailRegex.test(emailVal)){
                showError(email, 'Please enter a valid email address.');
                if(valid) email.focus();
                valid = false;
            } 
            else { 
                clearError(email); 
            }

            if(valid){
                alert('Registration successful!');
                form.reset();
            }

            return false; 
        }

        document.getElementById('regForm').addEventListener('submit', function(e){
            e.preventDefault();
            validateForm();
        });