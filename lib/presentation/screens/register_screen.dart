import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      )
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

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //*se extrajo FORMKEY de documentacion FLUTTER, tendremos control todo el formulario con FORMKEY


  @override
  Widget build(BuildContext context) {

    final registerCubit = context.watch<RegisterCubit>(); // se realiza la refencia para el REGISTER CUBIT

    return Form(  //WIGET que controlará nuestro formulario
      child: Column(
        children: [

          CustomTextFormField( // Está en: INPUT => CUSTOM...
            label: 'Nombre de usuario',
            onChanged: ( value ) {
              registerCubit.usernameChanged(value);
              _formKey.currentState?.validate();
            },
            validator: ( value ) {
              if ( value == null || value.isEmpty ) return 'Campo requerido';
              if ( value.trim().isEmpty ) return 'Campo requerido';
              if ( value.length < 6 ) return 'Más de 6 letras';
              return null;
            },
          ), 

          const SizedBox( height: 10), 

          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: ( value ) {
              registerCubit.emailChanged(value);
              _formKey.currentState?.validate();
            },
            validator: ( value ) {
              if ( value == null || value.isEmpty ) return 'Campo requerido';
              if ( value.trim().isEmpty ) return 'Campo requerido';
              final emailRegExp = RegExp( //! ayuda para validar emails ----------
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              );

              if (!emailRegExp.hasMatch( value ) ) return 'No tiene formato de correo'; // se indica... si no tiene EMAILREGEXPR el MATCH...
              return null;
            },
          ), 

          const SizedBox( height: 10),

          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: ( value ) {
              registerCubit.passwordChanged(value);
              _formKey.currentState?.validate();
            },
            validator: ( value ) {
              if ( value == null || value.isEmpty ) return 'Campo requerido';
              if ( value.trim().isEmpty ) return 'Campo requerido';
              if ( value.length < 6 ) return 'Más de 6 letras';
              return null;
            },
          ), 

          const SizedBox( height: 20),

          FilledButton.tonalIcon(
                onPressed: (){
                  
                  final isValid = _formKey.currentState!.validate();
                  if ( !isValid ) return;

                  registerCubit.onSubmit(); 

                }, 
                icon: const Icon( Icons.save ), 
                label: const Text('Crear usuario'),
                ),
        ],
      )
    );
  }
}