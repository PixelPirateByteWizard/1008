import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/pet.dart';
import '../../services/pet_care_service.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class AddPetSheet extends StatefulWidget {
  final PetCareService petService;

  const AddPetSheet({Key? key, required this.petService}) : super(key: key);

  @override
  State<AddPetSheet> createState() => _AddPetSheetState();
}

class _AddPetSheetState extends State<AddPetSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _speciesController = TextEditingController();
  final _breedController = TextEditingController();
  final _weightController = TextEditingController();
  DateTime? _birthDate;
  String? _photoUrl;
  bool _isLoading = false;
  final _dateFormat = DateFormat('MMMM d, y');
  File? _imageFile;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 1200,
    );

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _birthDate) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

  Future<void> _savePet() async {
    if (_formKey.currentState!.validate() && _birthDate != null) {
      setState(() => _isLoading = true);

      try {
        final pet = Pet(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          name: _nameController.text,
          species: _speciesController.text,
          breed: _breedController.text,
          birthDate: _birthDate!,
          weight: double.parse(_weightController.text),
          photoUrl: _imageFile?.path,
          careRecords: [],
        );

        await widget.petService.addPet(pet);
        if (mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving pet: $e')),
        );
      } finally {
        if (mounted) {
          setState(() => _isLoading = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        top: 16,
        left: 24,
        right: 24,
      ),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Text(
                'Add New Pet',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: theme.colorScheme.primary.withOpacity(0.2),
                    ),
                  ),
                  child: _imageFile != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            _imageFile!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo_rounded,
                              size: 40,
                              color: theme.colorScheme.primary,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Add Pet Photo',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _nameController,
                label: 'Pet Name',
                hint: 'Enter your pet\'s name',
                icon: Icons.pets,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _speciesController,
                label: 'Species',
                hint: 'e.g., Dog, Cat, Bird',
                icon: Icons.category,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _breedController,
                label: 'Breed',
                hint: 'e.g., Golden Retriever, Persian',
                icon: Icons.pets_rounded,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _weightController,
                label: 'Weight (kg)',
                hint: 'Enter pet\'s weight',
                icon: Icons.monitor_weight,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: _selectDate,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today,
                          color: theme.colorScheme.primary),
                      const SizedBox(width: 12),
                      Text(
                        _birthDate == null
                            ? 'Select Birth Date'
                            : _dateFormat.format(_birthDate!),
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _savePet,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text(
                        'Add Pet',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        if (keyboardType == TextInputType.number &&
            double.tryParse(value) == null) {
          return 'Please enter a valid number';
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _speciesController.dispose();
    _breedController.dispose();
    _weightController.dispose();
    super.dispose();
  }
}
