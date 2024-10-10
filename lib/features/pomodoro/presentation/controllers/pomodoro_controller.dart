import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PomodoroStatus { working, shortBreak, longBreak, idle }

class PomodoroState {
  final int workDuration;
  final int shortBreakDuration;
  final int longBreakDuration;
  final int remainingTime;
  final PomodoroStatus status;
  final int completedPomodoros;

  PomodoroState({
    required this.workDuration,
    required this.shortBreakDuration,
    required this.longBreakDuration,
    required this.remainingTime,
    required this.status,
    required this.completedPomodoros,
  });

  PomodoroState copyWith({
    int? workDuration,
    int? shortBreakDuration,
    int? longBreakDuration,
    int? remainingTime,
    PomodoroStatus? status,
    int? completedPomodoros,
  }) {
    return PomodoroState(
      workDuration: workDuration ?? this.workDuration,
      shortBreakDuration: shortBreakDuration ?? this.shortBreakDuration,
      longBreakDuration: longBreakDuration ?? this.longBreakDuration,
      remainingTime: remainingTime ?? this.remainingTime,
      status: status ?? this.status,
      completedPomodoros: completedPomodoros ?? this.completedPomodoros,
    );
  }
}

final pomodoroControllerProvider = StateNotifierProvider<PomodoroController, PomodoroState>((ref) {
  return PomodoroController();
});

class PomodoroController extends StateNotifier<PomodoroState> {
  Timer? _timer;

  PomodoroController() : super(PomodoroState(
    workDuration: 25 * 60,
    shortBreakDuration: 5 * 60,
    longBreakDuration: 15 * 60,
    remainingTime: 25 * 60,
    status: PomodoroStatus.idle,
    completedPomodoros: 0,
  ));

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
    state = state.copyWith(status: PomodoroStatus.working);
  }

  void pauseTimer() {
    _timer?.cancel();
    state = state.copyWith(status: PomodoroStatus.idle);
  }

  void resetTimer() {
    _timer?.cancel();
    state = state.copyWith(
      remainingTime: state.workDuration,
      status: PomodoroStatus.idle,
    );
  }

  void _tick() {
    if (state.remainingTime > 0) {
      state = state.copyWith(remainingTime: state.remainingTime - 1);
    } else {
      _timer?.cancel();
      _handlePomodoroComplete();
    }
  }

  void _handlePomodoroComplete() {
    final newCompletedPomodoros = state.completedPomodoros + 1;
    if (newCompletedPomodoros % 4 == 0) {
      state = state.copyWith(
        status: PomodoroStatus.longBreak,
        remainingTime: state.longBreakDuration,
        completedPomodoros: newCompletedPomodoros,
      );
    } else {
      state = state.copyWith(
        status: PomodoroStatus.shortBreak,
        remainingTime: state.shortBreakDuration,
        completedPomodoros: newCompletedPomodoros,
      );
    }
  }

  void setWorkDuration(int minutes) {
    state = state.copyWith(
      workDuration: minutes * 60,
      remainingTime: minutes * 60,
    );
  }

  void setShortBreakDuration(int minutes) {
    state = state.copyWith(shortBreakDuration: minutes * 60);
  }

  void setLongBreakDuration(int minutes) {
    state = state.copyWith(longBreakDuration: minutes * 60);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}