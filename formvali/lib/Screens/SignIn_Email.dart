import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formvali/Screens/Blocs/SignIn_Bloc.dart';
import 'package:formvali/Screens/Blocs/SignIn_Events.dart';
import 'package:formvali/Screens/Blocs/SignIn_States.dart';

class SignInEmail extends StatelessWidget {
  SignInEmail({super.key});
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In with Email",
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: ListView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errormMessage,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                }),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: emailController,
                  onChanged: (val) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangedEvent(
                            emailController.text, passwordController.text));
                  },
                  decoration: InputDecoration(hintText: 'Email Address'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (val) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangedEvent(
                            emailController.text, passwordController.text));
                  },
                  controller: passwordController,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                  if (state is SignInLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }

                  return CupertinoButton(
                    onPressed: () {
                      if (state is SignInValidState) {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInSubmittedEvent(
                                emailController.text, passwordController.text));
                      }
                    },
                    color:
                        (state is SignInValidState) ? Colors.blue : Colors.grey,
                    child: Text("Sign In"),
                  );
                })
              ],
            )),
      ),
    );
  }
}
// class SignInEmaill extends StatefulWidget {
//   const SignInEmail({super.key});

//   @override
//   State<SignInEmail> createState() => _SignInEmailState();
// }

// class _SignInEmailState extends State<SignInEmail> {
//   TextEditingController emailController = TextEditingController();

//   TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Sign In with Email",
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//             child: ListView(
//               physics: BouncingScrollPhysics(
//                   parent: AlwaysScrollableScrollPhysics()),
//               children: [
//                 BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
//                   if (state is SignInErrorState) {
//                     return Text(
//                       state.errormMessage,
//                       style: TextStyle(color: Colors.red),
//                     );
//                   } else {
//                     return Container();
//                   }
//                 }),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextField(
//                   controller: emailController,
//                   onChanged: (val) {
//                     BlocProvider.of<SignInBloc>(context).add(
//                         SignInTextChangedEvent(
//                             emailController.text, passwordController.text));
//                   },
//                   decoration: InputDecoration(hintText: 'Email Address'),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextField(
//                   onChanged: (val) {
//                     BlocProvider.of<SignInBloc>(context).add(
//                         SignInTextChangedEvent(
//                             emailController.text, passwordController.text));
//                   },
//                   controller: passwordController,
//                   decoration: InputDecoration(hintText: 'Password'),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
//                   if (state is SignInLoadingState) {
//                     return Center(child: CircularProgressIndicator());
//                   }

//                   return CupertinoButton(
//                     onPressed: () {
//                       if (state is SignInValidState) {
//                         BlocProvider.of<SignInBloc>(context).add(
//                             SignInSubmittedEvent(
//                                 emailController.text, passwordController.text));
//                       }
//                     },
//                     color:
//                         (state is SignInValidState) ? Colors.blue : Colors.grey,
//                     child: Text("Sign In"),
//                   );
//                 })
//               ],
//             )),
//       ),
//     );
//   }
// }
