
//? se agrega GO_ROUTER | pubspec assist => GO_ROUTER


import 'package:forms_app/presentation/screens/screens.dart';  //* archivo de barril para los SCREENS
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
 
  routes: [

   GoRoute(
     path: '/',
     builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/cubits',
      builder: (context, state) => const CubitCounterScreen(),
    ),

    GoRoute(
      path: '/counter-bloc',
      builder: (context, state) => const BlocCounterScreen(),
    ),

    GoRoute(
      path: '/new-usar',
      builder: (context, state) => const RegisterScreen(),
    ),

  ]
);