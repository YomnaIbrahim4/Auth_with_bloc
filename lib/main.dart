import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_up/bloc/signup_bloc.dart';
import 'package:sign_up/screens/sign_up_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Up With BLoC',
      home: BlocProvider(
        create: (context) => SignUpBloc()..add(InitiSingUpScreenEvent()),
        child: SignUpScreenWithBloc(),
      ),
    );
  }
}
