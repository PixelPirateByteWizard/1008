import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/pet.dart';
import '../../services/pet_care_service.dart';
import 'pet_details_screen.dart';
import 'add_pet_sheet.dart';

class PetsListScreen extends StatefulWidget {
  final PetCareService petService;

  const PetsListScreen({Key? key, required this.petService}) : super(key: key);

  @override
  State<PetsListScreen> createState() => _PetsListScreenState();
}

class _PetsListScreenState extends State<PetsListScreen>
    with SingleTickerProviderStateMixin {
  final DateFormat _dateFormat = DateFormat('MMM d, y');
  List<Pet> _pets = [];
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _loadPets();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadPets() async {
    final pets = await widget.petService.getPets();
    setState(() {
      _pets = pets;
    });
  }

  void _addPet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddPetSheet(petService: widget.petService),
    ).then((_) => _loadPets());
  }

  void _showPetDetails(Pet pet) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PetDetailsScreen(
          pet: pet,
          petService: widget.petService,
        ),
      ),
    ).then((_) => _loadPets());
  }

  Widget _buildPetStatusChip(Pet pet) {
    final lastCareRecord = pet.careRecords.isNotEmpty
        ? pet.careRecords.reduce((a, b) => a.date.isAfter(b.date) ? a : b)
        : null;

    late final Color backgroundColor;
    late final Color textColor;
    late final String label;

    if (lastCareRecord == null) {
      backgroundColor = const Color(0xFFE3F2FD);
      textColor = const Color(0xFF1976D2);
      label = 'New';
    } else {
      final daysSinceLastCare =
          DateTime.now().difference(lastCareRecord.date).inDays;
      if (daysSinceLastCare > 7) {
        backgroundColor = const Color(0xFFFFEBEE);
        textColor = const Color(0xFFD32F2F);
        label = 'Needs attention';
      } else {
        backgroundColor = const Color(0xFFE8F5E9);
        textColor = const Color(0xFF388E3C);
        label = 'Healthy';
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_pets.isEmpty) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'No pets added yet',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Add your first pet to start tracking their care',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF7F8C8D),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _addPet,
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Add Your First Pet',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _pets.length,
      itemBuilder: (context, index) {
        final pet = _pets[index];
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Card(
            elevation: 4,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () => _showPetDetails(pet),
              borderRadius: BorderRadius.circular(16),
              child: Column(
                children: [
                  if (pet.photoUrl != null)
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.network(
                        pet.photoUrl!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[200],
                          child: const Icon(Icons.error),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              pet.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                            _buildPetStatusChip(pet),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${pet.breed} ${pet.species}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF7F8C8D),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            _buildInfoItem(
                              Icons.cake_outlined,
                              _dateFormat.format(pet.birthDate),
                            ),
                            const SizedBox(width: 24),
                            _buildInfoItem(
                              Icons.monitor_weight_outlined,
                              '${pet.weight} kg',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: const Color(0xFF95A5A6),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF95A5A6),
          ),
        ),
      ],
    );
  }
}
