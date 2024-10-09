import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'todo_page.dart';

class StatisticsPage extends StatelessWidget {
  final List<TodoItem> todos;

  const StatisticsPage({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Statistics & Reports'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          bottom: TabBar(
            tabs: const [
              Tab(icon: Icon(Icons.pie_chart), text: 'Overview'),
              Tab(icon: Icon(Icons.calendar_view_week), text: 'Weekly'),
              Tab(icon: Icon(Icons.calendar_month), text: 'Monthly'),
            ],
            indicatorColor: Theme.of(context).colorScheme.secondary,
            labelColor: Theme.of(context).colorScheme.onPrimary,
            unselectedLabelColor:
                Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
          ),
        ),
        body: TabBarView(
          children: [
            TaskStatistics(todos: todos),
            WeeklyReport(todos: todos),
            MonthlyReport(todos: todos),
          ],
        ),
      ),
    );
  }
}

class TaskStatistics extends StatelessWidget {
  final List<TodoItem> todos;

  const TaskStatistics({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    int completed = todos.where((todo) => todo.isCompleted).length;
    int pending = todos.where((todo) => !todo.isCompleted).length;
    int overdue = todos
        .where((todo) =>
            !todo.isCompleted && todo.deadline.isBefore(DateTime.now()))
        .length;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task Overview',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 250,
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    color: Colors.green,
                    value: completed.toDouble(),
                    title: 'Completed',
                    radius: 100,
                    titleStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.blue,
                    value: pending.toDouble(),
                    title: 'Pending',
                    radius: 100,
                    titleStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    color: Colors.red,
                    value: overdue.toDouble(),
                    title: 'Overdue',
                    radius: 100,
                    titleStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
                sectionsSpace: 0,
                centerSpaceRadius: 40,
              ),
            ),
          ),
          const SizedBox(height: 32),
          _buildStatCard('Total Tasks', todos.length, Colors.purple),
          _buildStatCard('Completed', completed, Colors.green),
          _buildStatCard('Pending', pending, Colors.blue),
          _buildStatCard('Overdue', overdue, Colors.red),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, int value, Color color) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Text(
            value.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          '${(value / todos.length * 100).toStringAsFixed(1)}%',
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class WeeklyReport extends StatelessWidget {
  final List<TodoItem> todos;

  const WeeklyReport({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '本周任务完成情况',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ContributionGraph(todos: todos, isWeekly: true),
          ),
          const SizedBox(height: 24),
          const Text(
            '每日完成任务数',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: WeeklyBarChart(todos: todos),
          ),
        ],
      ),
    );
  }
}

class MonthlyReport extends StatelessWidget {
  final List<TodoItem> todos;

  const MonthlyReport({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '本月任务完成情况',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: ContributionGraph(todos: todos, isWeekly: false),
          ),
          const SizedBox(height: 24),
          const Text(
            '每日完成任务数',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: MonthlyBarChart(todos: todos),
          ),
        ],
      ),
    );
  }
}

class ContributionGraph extends StatelessWidget {
  final List<TodoItem> todos;
  final bool isWeekly;

  const ContributionGraph({
    super.key,
    required this.todos,
    required this.isWeekly,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startDate = isWeekly
        ? now.subtract(Duration(days: now.weekday - 1))
        : DateTime(now.year, now.month, 1);
    final endDate = isWeekly
        ? startDate.add(const Duration(days: 7))
        : DateTime(now.year, now.month + 1, 0);

    final completedTasks = todos.where((todo) => todo.isCompleted).toList();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isWeekly ? 7 : 7,
        childAspectRatio: 1,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: endDate.difference(startDate).inDays,
      itemBuilder: (context, index) {
        final date = startDate.add(Duration(days: index));
        final tasksCompletedOnDate = completedTasks
            .where((todo) =>
                todo.deadline.year == date.year &&
                todo.deadline.month == date.month &&
                todo.deadline.day == date.day)
            .length;

        Color color;
        if (tasksCompletedOnDate == 0) {
          color = Colors.grey[300]!;
        } else if (tasksCompletedOnDate < 3) {
          color = Colors.green[100]!;
        } else if (tasksCompletedOnDate < 5) {
          color = Colors.green[300]!;
        } else {
          color = Colors.green[700]!;
        }

        return Tooltip(
          message:
              '${DateFormat('MM-dd').format(date)}: $tasksCompletedOnDate 个任务完成',
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                '${date.day}',
                style: const TextStyle(fontSize: 10, color: Colors.black54),
              ),
            ),
          ),
        );
      },
    );
  }
}

class WeeklyBarChart extends StatelessWidget {
  final List<TodoItem> todos;

  const WeeklyBarChart({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final weekDays =
        List.generate(7, (index) => startOfWeek.add(Duration(days: index)));

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: todos.length.toDouble(),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '${rod.toY.toInt()} tasks',
                const TextStyle(color: Colors.white),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Text(DateFormat('E').format(weekDays[value.toInt()]));
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return Text(value.toInt().toString());
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: weekDays.asMap().entries.map((entry) {
          final index = entry.key;
          final date = entry.value;
          final completedTasks = todos
              .where((todo) =>
                  todo.isCompleted &&
                  todo.deadline.year == date.year &&
                  todo.deadline.month == date.month &&
                  todo.deadline.day == date.day)
              .length;

          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: completedTasks.toDouble(),
                color: Theme.of(context).colorScheme.primary,
                width: 16,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class MonthlyBarChart extends StatelessWidget {
  final List<TodoItem> todos;

  const MonthlyBarChart({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    final monthDays = List.generate(
        daysInMonth, (index) => DateTime(now.year, now.month, index + 1));

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: todos.length.toDouble(),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '${rod.toY.toInt()} tasks',
                const TextStyle(color: Colors.white),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() % 5 == 0) {
                  return Text('${value.toInt() + 1}');
                }
                return const Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                return Text(value.toInt().toString());
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: monthDays.asMap().entries.map((entry) {
          final index = entry.key;
          final date = entry.value;
          final completedTasks = todos
              .where((todo) =>
                  todo.isCompleted &&
                  todo.deadline.year == date.year &&
                  todo.deadline.month == date.month &&
                  todo.deadline.day == date.day)
              .length;

          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: completedTasks.toDouble(),
                color: Colors.green,
                width: 8,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
