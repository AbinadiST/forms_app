import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

//* Esto es la vista -----------------------------------------------------------

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: SingleChildScrollView(
          child: Column(
            children: const[
              
              FlutterLogo( size: 100),

              _RegisterForm(),

              SizedBox( height: 20 ),

              ],
            ),
        ),
      ),
    );
  }
}

//* Maneja el FORMULARIO ----------------------------------------------------------

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Form(  //WIGET que controlará nuestro formulario
      child: Column(
        children: [

          CustomTextFormField(
            label: 'Nombre de usuario',
          ), // Está en: INPUT => CUSTOM...

          SizedBox( height: 10), 

          CustomTextFormField(
            label: 'Correo electrónico',
          ), 

          SizedBox( height: 10),

          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
          ), 

          const SizedBox( height: 20),

          FilledButton.tonalIcon(
                onPressed: (){}, 
                icon: const Icon( Icons.save ), 
                label: const Text('Crear usuario'),
                ),
        ],
      )
    );
  }
}