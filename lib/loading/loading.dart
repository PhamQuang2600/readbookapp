import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDiaLog {
  static void showLoadingDiaLog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Scaffold(
              body: Center(
                child: SpinKitThreeInOut(
                  size: 50.0,
                  itemBuilder: (context, index) {
                    return const DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.amber, shape: BoxShape.circle));
                  },
                ),
              ),
            ));
  }

  static void hideDiaLog(BuildContext context) {
    Navigator.of(context).pop(LoadingDiaLog());
  }
}
