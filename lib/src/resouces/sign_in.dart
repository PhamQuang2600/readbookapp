import 'package:flutter/material.dart';
import 'package:readbookapp/animations/fade_animations.dart';
import 'package:readbookapp/data/data_test.dart';
import 'package:readbookapp/loading/loading.dart';
import 'package:readbookapp/src/resouces/home_page.dart';
import 'package:readbookapp/src/resouces/sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInBloc bloc = SignInBloc();
  TextEditingController user = TextEditingController();
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
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        if (bloc.isValid(user.text, password.text)) {
                          LoadingDiaLog.showLoadingDiaLog(context);

                          if (bloc.signIn(user.text, password.text)) {
                            Future.delayed(
                              const Duration(seconds: 2),
                              () {
                                LoadingDiaLog.hideDiaLog(context);
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (_) => const HomePage()),
                                    (Route<dynamic> route) => false);
                              },
                            );
                          } else {
                            Future.delayed(
                              const Duration(seconds: 2),
                              () {
                                LoadingDiaLog.hideDiaLog(context);
                                MsgDiaLog.showMessDiaLog(context, "SignIn",
                                    "Account or password incorrect. Please try again");
                              },
                            );
                          }
                        }
                      },
                      child: const Text(
                        'Sign In',
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const SignUpPage()));
                        },
                      );
                    },
                    child: const Text(
                      'Sign up now',
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
