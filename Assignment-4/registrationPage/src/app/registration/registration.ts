import { Component } from '@angular/core';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.html',
  styleUrls: ['./registration.css'],
})
export class Registration {
  model = {
    firstName: '',
    middleName: '',
    lastName: '',
    mobile: '',
    address: '',
    city: '',
    pincode: '',
    taluka: '',
    district: '',
    email: '',
    password: '',
    confirmPassword: '',
    gender: '',
    designation: ''
  };

  onSubmit(event: Event) {
    event.preventDefault();
    const form = event.target as HTMLFormElement;

    // read values from form (not relying on FormsModule)
    this.model.firstName = (form.querySelector('#firstName') as HTMLInputElement).value.trim();
    this.model.middleName = (form.querySelector('#middleName') as HTMLInputElement).value.trim();
    this.model.lastName = (form.querySelector('#lastName') as HTMLInputElement).value.trim();
    this.model.mobile = (form.querySelector('#mobile') as HTMLInputElement).value.trim();
    this.model.address = (form.querySelector('#address') as HTMLTextAreaElement).value.trim();
    this.model.city = (form.querySelector('#city') as HTMLInputElement).value.trim();
    this.model.pincode = (form.querySelector('#pincode') as HTMLInputElement).value.trim();
    this.model.taluka = (form.querySelector('#taluka') as HTMLInputElement).value.trim();
    this.model.district = (form.querySelector('#district') as HTMLInputElement).value.trim();
    this.model.email = (form.querySelector('#email') as HTMLInputElement).value.trim();
    this.model.password = (form.querySelector('#password') as HTMLInputElement).value;
    this.model.confirmPassword = (form.querySelector('#confirmPassword') as HTMLInputElement).value;
    const genderInput = form.querySelector('input[name="gender"]:checked') as HTMLInputElement;
    this.model.gender = genderInput ? genderInput.value : '';
    this.model.designation = (form.querySelector('#designation') as HTMLSelectElement).value;

    // validation
    const nameRe = /^[A-Za-z ]+$/;
    const mobileRe = /^\d{10}$/;
    const emailRe = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const errors: {id: string, ok: boolean}[] = [];

    errors.push({ id: 'firstNameErr', ok: !!this.model.firstName && nameRe.test(this.model.firstName) });
    errors.push({ id: 'middleNameErr', ok: !this.model.middleName || nameRe.test(this.model.middleName) });
    errors.push({ id: 'lastNameErr', ok: !!this.model.lastName && nameRe.test(this.model.lastName) });
    errors.push({ id: 'mobileErr', ok: mobileRe.test(this.model.mobile) });
    errors.push({ id: 'emailErr', ok: emailRe.test(this.model.email) });
    errors.push({ id: 'passwordErr', ok: !!this.model.password && this.model.password.length >= 6 });
    errors.push({ id: 'confirmPasswordErr', ok: this.model.confirmPassword === this.model.password });
    errors.push({ id: 'addressErr', ok: !!this.model.address });
    errors.push({ id: 'cityErr', ok: !!this.model.city });
    errors.push({ id: 'pincodeErr', ok: !!this.model.pincode });
    errors.push({ id: 'talukaErr', ok: !!this.model.taluka });
    errors.push({ id: 'districtErr', ok: !!this.model.district });
    errors.push({ id: 'genderErr', ok: !!this.model.gender });
    errors.push({ id: 'designationErr', ok: !!this.model.designation });

    let allOk = true;
    for (const e of errors) {
      const el = form.querySelector('#' + e.id) as HTMLElement;
      if (el) {
        el.style.display = e.ok ? 'none' : 'block';
      }
      if (!e.ok) { allOk = false; }
    }

    if (allOk) {
      // success behaviour — small confirmation and reset
      alert(`Registered successfully as ${this.model.designation || 'User'}\nName: ${this.model.firstName} ${this.model.lastName}`);
      form.reset();
      // hide any remaining error messages
      errors.forEach(e => {
        const el = form.querySelector('#' + e.id) as HTMLElement;
        if (el) el.style.display = 'none';
      });
    }
  }

  // live validation helper called from (input) bindings
  validateField(event: Event) {
    const input = event.target as HTMLInputElement;
    const form = input.form as HTMLFormElement;
    if (!form) { return; }
    // radios/selects don't have an id; map common names
    let id = input.id ? input.id + 'Err' : '';
    if (!id) {
      if (input.name === 'gender') { id = 'genderErr'; }
      else if (input.name === 'designation') { id = 'designationErr'; }
    }
    const errEl = form.querySelector('#' + id) as HTMLElement;
    if (!errEl) { return; }

    let ok = true;
    const value = input.value.trim();
    // if element has no id (radios), use name
    const key = input.id || input.name;
    switch (key) {
      case 'firstName':
      case 'middleName':
      case 'lastName':
        ok = /^[A-Za-z ]+$/.test(value) || (key === 'middleName' && value === '');
        break;
      case 'mobile':
        ok = /^\d{10}$/.test(value);
        break;
      case 'email':
        ok = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
        break;
      case 'password':
        ok = value.length >= 6;
        // also re‑validate confirm
        const conf = form.querySelector('#confirmPassword') as HTMLInputElement;
        if (conf) { this.validateField(conf as any); }
        break;
      case 'confirmPassword':
        const pwd = (form.querySelector('#password') as HTMLInputElement).value;
        ok = value === pwd;
        break;
      case 'gender':
        ok = !!form.querySelector('input[name="gender"]:checked');
        break;
      case 'designation':
        ok = value.trim().length > 0;
        break;
      default:
        ok = value.length > 0;
    }

    errEl.style.display = ok ? 'none' : 'block';
    if (input) {
      if (ok) input.classList.remove('invalid');
      else input.classList.add('invalid');
    }
  }

  togglePasswords(show: boolean) {
    const form = document.getElementById('regForm') as HTMLFormElement;
    if (!form) { return; }
    const pwd = form.querySelector('#password') as HTMLInputElement;
    const cpwd = form.querySelector('#confirmPassword') as HTMLInputElement;
    if (pwd) { pwd.type = show ? 'text' : 'password'; }
    if (cpwd) { cpwd.type = show ? 'text' : 'password'; }
  }
}
