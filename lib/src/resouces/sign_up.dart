import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readbookapp/animations/fade_animations.dart';
import 'package:readbookapp/bloc/user/user_bloc.dart';
import 'package:readbookapp/models/user.dart';
import 'package:readbookapp/src/widget/textfield_custom.dart';

import '../../loading/loading.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const String routeName = '/sign-up';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SignUpPage(),
    );
  }

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isShowPass = true;

  String errorName = '';
  String errorAddress = '';
  String errorEmail = '';
  String errorPassword = '';
  String errorConfirm = '';
  TextEditingController name = TextEditingController();
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
              TextFieldCustom(
                  controller: email, iconName: 'Email', error: errorEmail),
              const SizedBox(
                height: 20,
              ),
              TextFieldCustom(
                  controller: name, iconName: 'Name', error: errorName),
              const SizedBox(
                height: 20,
              ),
              TextFieldCustom(
                  controller: address,
                  iconName: 'Address',
                  error: errorAddress),
              const SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: Colors.black,
                controller: password,
                obscureText: isShowPass,
                decoration: InputDecoration(
                  errorText: errorPassword.isNotEmpty ? errorPassword : null,
                  prefixIcon: const Icon(
                    Iconsax.key,
                    color: Colors.black54,
                  ),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowPass = !isShowPass;
                        });
                      },
                      child: isShowPass
                          ? const Icon(
                              Icons.remove_red_eye,
                              color: Colors.black54,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.black54,
                            )),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: Colors.black,
                controller: confirmPassword,
                obscureText: isShowPass,
                decoration: InputDecoration(
                  errorText: errorConfirm.isNotEmpty ? errorConfirm : null,
                  prefixIcon: const Icon(Iconsax.key, color: Colors.black54),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowPass = !isShowPass;
                        });
                      },
                      child: isShowPass
                          ? const Icon(
                              Icons.remove_red_eye,
                              color: Colors.black54,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: Colors.black54,
                            )),
                  hintText: 'Confirm Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        if (name.text.isEmpty) {
                          setState(() {
                            errorName = 'Name not empty!';
                          });
                        } else if (address.text.isEmpty) {
                          setState(() {
                            errorAddress = 'address not empty!';
                          });
                        } else if (email.text.isEmpty) {
                          setState(() {
                            errorEmail = 'email not empty!';
                          });
                        } else if (password.text.isEmpty) {
                          setState(() {
                            errorPassword = 'Password not empty!';
                          });
                        } else if (confirmPassword.text.isEmpty) {
                          setState(() {
                            errorConfirm = 'Confirm password not empty!';
                          });
                        } else if (password.text != confirmPassword.text) {
                          setState(() {
                            errorConfirm = 'Password incorrect!';
                          });
                        } else {
                          var user = Users(
                              name: name.text,
                              email: email.text,
                              address: address.text,
                              password: password.text,
                              image: '');
                          Future.delayed(
                            Duration.zero,
                            () {
                              LoadingDiaLog.showLoadingDiaLog(context);
                              Future.delayed(
                                const Duration(seconds: 2),
                                () {
                                  var success =
                                      BlocProvider.of<UserBloc>(context)
                                        ..add(AddUser(user: user));
                                  if (success != null) {
                                    LoadingDiaLog.hideDiaLog(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Sign up success!')));
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            '/', (route) => false);
                                  } else {
                                    LoadingDiaLog.hideDiaLog(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text('Sign up fail!')));
                                  }
                                },
                              );
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
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            '/sign-in',
                            (route) => false,
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Sign in now',
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
