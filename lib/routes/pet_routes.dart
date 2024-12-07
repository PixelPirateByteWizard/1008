import 'package:flutter/material.dart';
import '../screens/pets/pet_details_screen.dart';
import '../services/pet_care_service.dart';
import '../models/pet.dart';

class PetRoutes {
  static Map<String, Widget Function(BuildContext)> getRoutes(PetCareService petService) {
    return {
      '/feeding-schedule': (context) => const FeedingScheduleScreen(),
      '/exercise-tracking': (context) => const ExerciseTrackingScreen(),
      '/grooming': (context) => const GroomingScreen(),
      '/vaccinations': (context) => const VaccinationsScreen(),
      '/medications': (context) => const MedicationsScreen(),
      '/vet-visits': (context) => const VetVisitsScreen(),
    };
  }
}

// Placeholder screens - to be implemented
class FeedingScheduleScreen extends StatelessWidget {
  const FeedingScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feeding Schedule')),
      body: const Center(child: Text('Coming Soon')),
    );
  }
}

class ExerciseTrackingScreen extends StatelessWidget {
  const ExerciseTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise Tracking')),
      body: const Center(child: Text('Coming Soon')),
    );
  }
}

class GroomingScreen extends StatelessWidget {
  const GroomingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grooming')),
      body: const Center(child: Text('Coming Soon')),
    );
  }
}

class VaccinationsScreen extends StatelessWidget {
  const VaccinationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vaccinations')),
      body: const Center(child: Text('Coming Soon')),
    );
  }
}

class MedicationsScreen extends StatelessWidget {
  const MedicationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medications')),
      body: const Center(child: Text('Coming Soon')),
    );
  }
}

class VetVisitsScreen extends StatelessWidget {
  const VetVisitsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vet Visits')),
      body: const Center(child: Text('Coming Soon')),
    );
  }
}
