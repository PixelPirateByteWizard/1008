import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/pomodoro_controller.dart';

class PomodoroPage extends ConsumerWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pomodoroState = ref.watch(pomodoroControllerProvider);
    final pomodoroController = ref.read(pomodoroControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatTime(pomodoroState.remainingTime),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Status: ${pomodoroState.status.toString().split('.').last}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Text(
              'Completed Pomodoros: ${pomodoroState.completedPomodoros}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: pomodoroState.status == PomodoroStatus.idle
                      ? pomodoroController.startTimer
                      : pomodoroController.pauseTimer,
                  child: Text(
                    pomodoroState.status == PomodoroStatus.idle ? 'Start' : 'Pause',
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: pomodoroController.resetTimer,
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            _buildDurationSetter(
              context,
              'Work Duration',
              pomodoroState.workDuration ~/ 60,
              (value) => pomodoroController.setWorkDuration(value),
            ),
            _buildDurationSetter(
              context,
              'Short Break Duration',
              pomodoroState.shortBreakDuration ~/ 60,
              (value) => pomodoroController.setShortBreakDuration(value),
            ),
            _buildDurationSetter(
              context,
              'Long Break Duration',
              pomodoroState.longBreakDuration ~/ 60,
              (value) => pomodoroController.setLongBreakDuration(value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDurationSetter(BuildContext context, String label, int initialValue, Function(int) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.titleMedium),
          SizedBox(
            width: 100,
            child: TextFormField(
              initialValue: initialValue.toString(),
              keyboardType: TextInputType.number,
              onChanged: (value) => onChanged(int.tryParse(value) ?? initialValue),
              decoration: const InputDecoration(
                suffix: Text('min'),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(int timeInSeconds) {
    int minutes = timeInSeconds ~/ 60;
    int seconds = timeInSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}