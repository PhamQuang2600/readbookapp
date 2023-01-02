import 'package:flutter/material.dart';
import 'package:readbookapp/animations/fade_animations.dart';
import 'package:readbookapp/loading/loading.dart';

import 'home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  bool textVisible = true;
  bool isLoading = false;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    animation =
        Tween<double>(begin: 1.0, end: 25.0).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets_image/one.jpg'), fit: BoxFit.fill)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(.2)
          ])),
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const FadeAnimation(
                    .5,
                    Text(
                      "Do you think some read books?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const FadeAnimation(
                    1,
                    Text(
                      "Read book now, click to get start!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  FadeAnimation(
                      1.2,
                      ScaleTransition(
                        scale: animation,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [Colors.yellow, Colors.orange])),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 50),
                            opacity: textVisible ? 1.0 : 0.0,
                            child: MaterialButton(
                                minWidth: double.infinity,
                                onPressed: () {
                                  LoadingDiaLog.showLoadingDiaLog(context);
                                  Future.delayed(
                                    const Duration(seconds: 2),
                                    () {
                                      LoadingDiaLog.hideDiaLog(context);
                                      LoadingDataHome.showLoadingData(context);
                                      Future.delayed(
                                        const Duration(seconds: 3),
                                        () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage(),
                                          ));
                                        },
                                      );
                                    },
                                  );
                                },
                                child: const Text(
                                  "Get start",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                    1.4,
                    AnimatedOpacity(
                      opacity: textVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 50),
                      child: const Align(
                        child: Text(
                          "Read book in every freetime",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
