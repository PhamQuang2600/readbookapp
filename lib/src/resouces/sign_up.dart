import 'package:flutter/material.dart';
import 'package:readbookapp/animations/fade_animations.dart';
import 'package:readbookapp/data/data_test.dart';
import 'package:readbookapp/src/resouces/sign_in.dart';

import '../../loading/loading.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpBloc bloc = SignUpBloc();
  bool isShowPass = true;
  TextEditingController user = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(backgroundColor: Colors.grey[300], elevation: 0),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
            child: FadeAnimation(
          .6,
          Column(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets_image/six.jpg'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: bloc.userStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: user,
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'Account',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: bloc.addressStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: address,
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          prefixIcon: const Icon(Icons.email_outlined),
                          hintText: 'Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: bloc.emailStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: email,
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          prefixIcon: const Icon(Icons.email),
                          hintText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: bloc.passStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: password,
                      obscureText: isShowPass,
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isShowPass = !isShowPass;
                                });
                              },
                              child: isShowPass
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(Icons.visibility_off)),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder(
                  stream: bloc.confirmStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: confirmPassword,
                      obscureText: isShowPass,
                      decoration: InputDecoration(
                          errorText: snapshot.hasError
                              ? snapshot.error.toString()
                              : null,
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isShowPass = !isShowPass;
                                });
                              },
                              child: isShowPass
                                  ? const Icon(Icons.remove_red_eye)
                                  : const Icon(Icons.visibility_off)),
                          hintText: 'Confirm Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        if (bloc.isValid(user.text, password.text, address.text,
                            email.text, confirmPassword.text)) {
                          LoadingDiaLog.showLoadingDiaLog(context);
                          AlertDialog alert = AlertDialog(
                            content:
                                const Text('Sign Up success, Sign up now!'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    LoadingDiaLog.hideDiaLog(context);
                                    Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (_) => const SignInPage()),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                  child: const Text('OK'))
                            ],
                          );
                          Future.delayed(
                            const Duration(seconds: 2),
                            () {
                              showDialog(
                                  context: context, builder: (_) => alert);
                            },
                          );
                        }
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18),
                      ))),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'I have a account!',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Future.delayed(
                        Duration.zero,
                        () {
                          LoadingDiaLog.showLoadingDiaLog(context);
                        },
                      );
                      Future.delayed(
                        const Duration(seconds: 2),
                        () {
                          LoadingDiaLog.hideDiaLog(context);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (_) => const SignInPage()),
                              (Route<dynamic> route) => false);
                        },
                      );
                    },
                    child: const Text(
                      'Sign in now!',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  )
                ]),
              )
            ],
          ),
        )),
      ),
    );
  }
}
