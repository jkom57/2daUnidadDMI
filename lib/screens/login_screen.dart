import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dos_uno_dos/providers/login_form_provider.dart';
import 'package:dos_uno_dos/widgets/widgets.dart';
import 'package:dos_uno_dos/ui/input_decorations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 250,),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 30),

                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: const _LoginForm(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50,),
              const Text('Crear una nueva cuenta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const SizedBox(height: 50,),
            ],
          ),
        )
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        // TODO: mantener la referencia al key
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: loginForm.formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'john.doe@gmail.com',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email_rounded,
              ),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                  ? null
                  : 'El valor ingresado no luce como un correo';
              },
            ),
            const SizedBox(height: 30,),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '******',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline,
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                  ? null
                  : 'La contraseña debe de ser de 6 caracteres';
              },
            ),
            const SizedBox(height: 30,),
            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading
                    ? 'Espere'
                    : 'Ingresar',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              onPressed: loginForm.isLoading ? null : () async {
                FocusScope.of(context).unfocus();
                if (!loginForm.isValidForm()) return;
                loginForm.isLoading = true;
                await Future.delayed(const Duration(seconds: 2));
                // TODO: validar si el login es correcto
                loginForm.isLoading = false;
                Navigator.pushReplacementNamed(context, 'home');
              }
            )
          ],
        ),
      ),
    );
  }
}