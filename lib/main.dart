import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'models/auth_repo.dart';
import 'login_bloc/login_bloc.dart';
import 'signup_bloc/signup_bloc.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = AuthRepo();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc(authRepo)),
        BlocProvider(create: (_) => SignUpBloc(authRepo)),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreenWithBloc(),
      ),
    );
  }
}
