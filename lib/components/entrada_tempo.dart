import 'package:flutter/material.dart';
import 'package:flutter_pomodoro_clock/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;
  final void Function()? inc;
  final void Function()? dec;

  const EntradaTempo({
    required this.titulo,
    required this.valor,
    this.inc,
    this.dec,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          titulo,
          style: const TextStyle(fontSize: 26.0),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Ink(
              decoration: ShapeDecoration(
                color: store.estaTrabalhando() ? Colors.red : Colors.green,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                onPressed: dec,
                icon: const Icon(Icons.arrow_downward),
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '$valor min',
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
            Ink(
              decoration: ShapeDecoration(
                color: store.estaTrabalhando() ? Colors.red : Colors.green,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                onPressed: inc,
                icon: const Icon(Icons.arrow_upward),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
