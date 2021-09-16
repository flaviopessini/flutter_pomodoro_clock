import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_pomodoro_clock/components/cronometro.dart';
import 'package:flutter_pomodoro_clock/components/entrada_tempo.dart';
import 'package:flutter_pomodoro_clock/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);

    bool trabalhando() => store.iniciado && store.estaTrabalhando();

    bool descansando() => store.iniciado && store.estaDescansando();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Cronometro(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EntradaTempo(
                    titulo: 'Trabalho',
                    valor: store.tempoTrabalho,
                    dec: trabalhando() ? null : store.decrementarTempoTrabalho,
                    inc: trabalhando() ? null : store.incrementarTempoTrabalho,
                  ),
                  EntradaTempo(
                    titulo: 'Descanso',
                    valor: store.tempoDescanso,
                    dec: descansando() ? null : store.decrementarTempoDescanso,
                    inc: descansando() ? null : store.incrementarTempoDescanso,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
