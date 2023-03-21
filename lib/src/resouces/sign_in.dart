import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readbookapp/animations/fade_animations.dart';
import 'package:readbookapp/loading/loading.dart';
import 'package:readbookapp/src/widget/book_error.dart';
import 'package:readbookapp/src/widget/something_went_wrong.dart';
import 'package:readbookapp/src/widget/textfield_custom.dart';

import '../../bloc/user/user_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const String routeName = '/sign-in';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SignInPage());
  }

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String errorUser = '';
  String errorPass = '';
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isShowPass = true;
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
              const SizedBox(
                height: 150,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets_image/five.jpg'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldCustom(
                  controller: email, iconName: 'Email', error: errorUser),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: password,
                obscureText: isShowPass,
                decoration: InputDecoration(
                  errorText: errorPass.isEmpty ? null : errorPass,
                  prefixIcon: const Icon(Icons.password, color: Colors.black54),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowPass = !isShowPass;
                        });
                      },
                      child: isShowPass
                          ? const Icon(Icons.remove_red_eye,
                              color: Colors.black54)
                          : const Icon(Icons.visibility_off,
                              color: Colors.black54)),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return Container();
                  } else if (state is UserListLoaded) {
                    return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {
                              if (email.text.isEmpty) {
                                setState(() {
                                  errorUser = 'User not empty! try again.';
                                });
                              } else if (password.text.isEmpty) {
                                setState(() {
                                  errorPass = 'Password not empty! try again.';
                                });
                              } else {
                                Future.delayed(
                                  Duration.zero,
                                  () {
                                    LoadingDiaLog.showLoadingDiaLog(context);
                                    Future.delayed(
                                      const Duration(seconds: 2),
                                      () {
                                        var success = state.user.where((e) =>
                                            e.email == email.text &&
                                            e.password == password.text);
                                        if (success.isEmpty) {
                                          LoadingDiaLog.hideDiaLog(context);
                                          MsgDiaLog.showMessDiaLog(
                                              context,
                                              "SignIn",
                                              "Account or password incorrect. Please try again");
                                        } else {
                                          LoadingDiaLog.hideDiaLog(context);
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  '/',
                                                  (Route<dynamic> route) =>
                                                      false);
                                        }
                                      },
                                    );
                                  },
                                );
                              }
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(fontSize: 18),
                            )));
                  } else if (state is UserError) {
                    return BookShowError(state.message);
                  } else {
                    return const SomethingWentWrong();
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        'I don\'t have a account!',
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
                            Navigator.of(context).pushNamed('/sign-up');
                          },
                        );
                      },
                      child: const Text(
                        'Sign up now',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
