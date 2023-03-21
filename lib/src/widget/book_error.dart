import 'package:flutter/widgets.dart';

class BookShowError extends StatelessWidget {
  final String message;
  const BookShowError(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
