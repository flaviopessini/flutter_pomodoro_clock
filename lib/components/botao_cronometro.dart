import 'package:flutter/material.dart';

class BotaoCronometro extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? onPressed;

  const BotaoCronometro({
    required this.texto,
    required this.icone,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        textStyle: const TextStyle(fontSize: 24.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              icone,
              size: 32.0,
            ),
          ),
          Text(
            texto,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
