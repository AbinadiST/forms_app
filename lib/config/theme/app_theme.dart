

import 'package:flutter/material.dart';

class AppTheme {

  ThemeData getTheme() {

    const seedColor = Colors.deepPurple;

    return ThemeData(

      useMaterial3: true,
      colorSchemeSeed: seedColor,
      listTileTheme: const ListTileThemeData( 
        iconColor: seedColor //indicamos que el ICONO sea color morado en toda la app
      )
    );
  }
}