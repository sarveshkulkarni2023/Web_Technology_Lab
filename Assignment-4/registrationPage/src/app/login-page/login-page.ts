import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'app-login-page',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './login-page.html',
  styleUrl: './login-page.css',
})
export class LoginPage {
  model = {
    email: '',
    password: ''
  };

  onLogin(event: Event) {
    event.preventDefault();
    const form = event.target as HTMLFormElement;
    this.model.email = (form.querySelector('#email') as HTMLInputElement).value.trim();
    this.model.password = (form.querySelector('#password') as HTMLInputElement).value;

    const emailRe = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const errors: {id: string, ok: boolean}[] = [];
    errors.push({ id: 'emailErr', ok: emailRe.test(this.model.email) });
    errors.push({ id: 'passwordErr', ok: !!this.model.password });

    let allOk = true;
    for (const e of errors) {
      const el = form.querySelector('#' + e.id) as HTMLElement;
      if (el) el.style.display = e.ok ? 'none' : 'block';
      if (!e.ok) { allOk = false; }
    }

    if (allOk) {
      alert('Login successful');
      // actual authentication logic would go here
      form.reset();
      errors.forEach(e => {
        const el = form.querySelector('#' + e.id) as HTMLElement;
        if (el) el.style.display = 'none';
      });
    }
  }

  validateField(event: Event) {
    const input = event.target as HTMLInputElement;
    const form = input.form as HTMLFormElement;
    if (!form) { return; }
    const id = input.id + 'Err';
    const errEl = form.querySelector('#' + id) as HTMLElement;
    if (!errEl) { return; }

    let ok = true;
    const value = input.value.trim();
    switch (input.id) {
      case 'email':
        ok = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
        break;
      case 'password':
        ok = value.length > 0;
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
    const form = document.getElementById('loginForm') as HTMLFormElement;
    if (!form) { return; }
    const pwd = form.querySelector('#password') as HTMLInputElement;
    if (pwd) { pwd.type = show ? 'text' : 'password'; }
  }
}
