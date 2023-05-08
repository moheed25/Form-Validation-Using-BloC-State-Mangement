import 'package:flutter/material.dart';
import 'package:formvali/Screens/Blocs/SignIn_Bloc.dart';
import 'package:formvali/Screens/SignIn_Email.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Validation Using Bloc"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                              create: (context) => SignInBloc(),
                              child: SignInEmail())));
                },
                child: Text("Sign in With Email")),
          )
        ],
      ),
    );
  }
}
