import 'package:flutter/widgets.dart';

class Errormessage extends StatelessWidget {
  const Errormessage(this.message, {super.key});

  final String message;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(message),
      ),
    );
  }
}
