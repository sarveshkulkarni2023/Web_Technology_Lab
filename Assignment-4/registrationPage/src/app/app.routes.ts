import { Routes } from '@angular/router';
import { Registration } from './registration/registration';
import { LoginPage } from './login-page/login-page';

export const routes: Routes = [
    {path:'',component: LoginPage},
    {path: 'login', component: LoginPage },
    {path: 'registration', component: Registration }
];
