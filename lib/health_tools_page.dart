import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

// State notifier to manage water intake data
class WaterIntakeNotifier extends StateNotifier<WaterIntakeState> {
  WaterIntakeNotifier() : super(WaterIntakeState());

  void setDailyGoal(double goal) {
    state = state.copyWith(dailyGoal: goal);
  }

  void addWaterIntake(double amount) {
    final newTotal = state.totalIntake + amount;
    final newEntries = [
      ...state.entries,
      WaterEntry(amount: amount, timestamp: DateTime.now())
    ];
    state = state.copyWith(totalIntake: newTotal, entries: newEntries);
  }

  void resetDailyIntake() {
    state = state.copyWith(totalIntake: 0, entries: []);
  }
}

// State class for water intake
class WaterIntakeState {
  final double dailyGoal;
  final double totalIntake;
  final List<WaterEntry> entries;

  WaterIntakeState({
    this.dailyGoal = 2000,
    this.totalIntake = 0,
    this.entries = const [],
  });

  WaterIntakeState copyWith({
    double? dailyGoal,
    double? totalIntake,
    List<WaterEntry>? entries,
  }) {
    return WaterIntakeState(
      dailyGoal: dailyGoal ?? this.dailyGoal,
      totalIntake: totalIntake ?? this.totalIntake,
      entries: entries ?? this.entries,
    );
  }
}

// Water entry class
class WaterEntry {
  final double amount;
  final DateTime timestamp;

  WaterEntry({required this.amount, required this.timestamp});
}

// Provider for water intake state
final waterIntakeProvider =
    StateNotifierProvider<WaterIntakeNotifier, WaterIntakeState>((ref) {
  return WaterIntakeNotifier();
});

class HealthToolsPage extends ConsumerWidget {
  const HealthToolsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final waterIntakeState = ref.watch(waterIntakeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Intake '),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWaterTrackerCard(context, waterIntakeState, ref),
              const SizedBox(height: 24),
              _buildWaterIntakeHistory(waterIntakeState),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWaterTrackerCard(
      BuildContext context, WaterIntakeState state, WidgetRef ref) {
    final progress = state.totalIntake / state.dailyGoal;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Water Intake Tracker',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildWaterProgressIndicator(state, progress),
            const SizedBox(height: 24),
            _buildQuickAddButtons(ref),
            const SizedBox(height: 16),
            _buildWaterGoalSetting(ref),
          ],
        ),
      ),
    );
  }

  Widget _buildWaterProgressIndicator(WaterIntakeState state, double progress) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 12,
                backgroundColor: Colors.blue[100],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            Column(
              children: [
                Text(
                  '${state.totalIntake.toStringAsFixed(0)}ml',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  'of ${state.dailyGoal.toStringAsFixed(0)}ml',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          '${(progress * 100).toStringAsFixed(1)}% of daily goal',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildWaterGoalSetting(WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () => _showGoalSettingDialog(ref),
      icon: const Icon(Icons.edit),
      label: const Text('Set Daily Goal'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _showGoalSettingDialog(WidgetRef ref) {
    final currentGoal = ref.read(waterIntakeProvider).dailyGoal;
    final controller =
        TextEditingController(text: currentGoal.toStringAsFixed(0));

    showDialog(
      context: ref.context,
      builder: (context) => AlertDialog(
        title: const Text('Set Daily Water Goal'),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Goal (ml)',
            suffixText: 'ml',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newGoal = double.tryParse(controller.text);
              if (newGoal != null && newGoal > 0) {
                ref.read(waterIntakeProvider.notifier).setDailyGoal(newGoal);
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAddButtons(WidgetRef ref) {
    final amounts = [100, 200, 300, 500];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: amounts
          .map((amount) => ElevatedButton(
                onPressed: () => ref
                    .read(waterIntakeProvider.notifier)
                    .addWaterIntake(amount.toDouble()),
                child: Text('+${amount}ml'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                  foregroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildWaterIntakeHistory(WaterIntakeState state) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today\'s Water Intake',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.entries.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final entry = state.entries[index];
                return ListTile(
                  leading: const Icon(Icons.water_drop, color: Colors.blue),
                  title: Text('${entry.amount.toStringAsFixed(0)}ml'),
                  subtitle: Text(DateFormat('HH:mm').format(entry.timestamp)),
                  trailing: Text(
                    '${((entry.amount / state.dailyGoal) * 100).toStringAsFixed(1)}%',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
