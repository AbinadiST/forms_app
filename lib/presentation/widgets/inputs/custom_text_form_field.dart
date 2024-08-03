import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String? label;
  final String? hint;
  final String? errorMassage;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key, 
    this.label, 
    this.hint, 
    this.errorMassage, 
    this.obscureText = false,
    this.onChanged, 
    this.validator,
    });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      // borderSide: BorderSide( color: colors.primary ),  || solo es una referencia de como se ve
      borderRadius: BorderRadius.circular(40)
    );

    return TextFormField(

      onChanged: onChanged, // mismo valor que la propiedad de la clase
      validator: validator, // mismo valor que la propiedad de la calse 
      obscureText: obscureText,

      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith( borderSide: BorderSide( color: colors.primary )), 

        //Estos dos son para mantener el diseño de los campos al marcar error
        errorBorder: border.copyWith( borderSide: BorderSide( color: Colors.red.shade800 )),
        focusedErrorBorder: border.copyWith( borderSide: BorderSide( color: Colors.red.shade800 )),

        isDense: true,
        label: label != null ? Text(label!) : null,
        hintText: hint,
        errorText: errorMassage,
        focusColor: colors.primary,
        // prefix: Icon( Icons.supervised_user_circle_outlined, color: colors.primary,) | pone el ICON al inicio

      ),
    );
  }
}