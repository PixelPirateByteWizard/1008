import 'package:flutter/material.dart';
import '../services/pet_care_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../models/pet.dart';
import 'pets/pets_list_screen.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:image_picker/image_picker.dart';

class PetManagementScreen extends StatefulWidget {
  final PetCareService petService;

  const PetManagementScreen({super.key, required this.petService});

  @override
  State<PetManagementScreen> createState() => _PetManagementScreenState();
}

class _PetManagementScreenState extends State<PetManagementScreen> {
  List<Pet> _pets = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPets();
  }

  Future<void> _loadPets() async {
    try {
      final pets = await widget.petService.getPets();
      setState(() {
        _pets = pets;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load pets')),
        );
      }
    }
  }

  Future<void> _addPet() async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => AddPetSheet(
        petService: widget.petService,
        onPetAdded: _loadPets,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'My Pets',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.add_circle_outline, size: 28),
              color: Theme.of(context).primaryColor,
              onPressed: _addPet,
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _pets.isEmpty
              ? _buildEmptyState()
              : _buildPetsList(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          const Text(
            'No Pets Yet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Add your first pet to get started',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: _addPet,
            icon: const Icon(Icons.add),
            label: const Text('Add Pet'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPetsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _pets.length,
      itemBuilder: (context, index) {
        final pet = _pets[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Hero(
              tag: 'pet-${pet.id}',
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey[200],
                backgroundImage:
                    pet.photoUrl != null ? NetworkImage(pet.photoUrl!) : null,
                child: pet.photoUrl == null
                    ? const Icon(Icons.pets, color: Colors.grey)
                    : null,
              ),
            ),
            title: Text(
              pet.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  pet.breed,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.event_note,
                        size: 16, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 4),
                    Text(
                      '${pet.careRecords.length} records',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[400],
              size: 16,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PetDetailsScreen(
                    pet: pet,
                    petService: widget.petService,
                  ),
                ),
              ).then((_) => _loadPets());
            },
          ),
        );
      },
    );
  }
}

class AddPetSheet extends StatefulWidget {
  final PetCareService petService;
  final VoidCallback onPetAdded;

  const AddPetSheet({
    super.key,
    required this.petService,
    required this.onPetAdded,
  });

  @override
  State<AddPetSheet> createState() => _AddPetSheetState();
}

class _AddPetSheetState extends State<AddPetSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _speciesController = TextEditingController();
  final _breedController = TextEditingController();
  final _weightController = TextEditingController();
  DateTime _birthDate = DateTime.now();
  String? _photoUrl;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // TODO: Implement image upload and get URL
        setState(() {
          _photoUrl = 'temp_url'; // Replace with actual upload URL
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to pick image')),
        );
      }
    }
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthDate,
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
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final pet = Pet(
          id: const Uuid().v4(),
          name: _nameController.text,
          species: _speciesController.text,
          breed: _breedController.text,
          birthDate: _birthDate,
          weight: double.parse(_weightController.text),
          photoUrl: _photoUrl,
        );

        await widget.petService.addPet(pet);
        widget.onPetAdded();

        if (mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to add pet')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add New Pet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      _photoUrl != null ? NetworkImage(_photoUrl!) : null,
                  child: _photoUrl == null
                      ? const Icon(Icons.add_a_photo, size: 40)
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _speciesController,
                decoration: const InputDecoration(
                  labelText: 'Species',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a species';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _breedController,
                decoration: const InputDecoration(
                  labelText: 'Breed',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a breed';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(
                  labelText: 'Weight (kg)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter weight';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text(
                  'Birth Date: ${DateFormat('MMM d, y').format(_birthDate)}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: _selectDate,
                tileColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _savePet,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Add Pet'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
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

class PetDetailsScreen extends StatefulWidget {
  final Pet pet;
  final PetCareService petService;

  const PetDetailsScreen({
    super.key,
    required this.pet,
    required this.petService,
  });

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  late Pet _currentPet;

  @override
  void initState() {
    super.initState();
    _currentPet = widget.pet;
  }

  Future<void> _refreshPetData() async {
    try {
      final pets = await widget.petService.getPets();
      final updatedPet = pets.firstWhere((p) => p.id == widget.pet.id);
      setState(() {
        _currentPet = updatedPet;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to refresh pet data')),
        );
      }
    }
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildCareRecordsList(List<CareRecord> records) {
    if (records.isEmpty) {
      return const Center(
        child: Text('No care records yet'),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[index];
        return Card(
          child: ListTile(
            leading: _getCareTypeIcon(record.type),
            title: Text(record.description),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat('MMM dd, yyyy').format(record.date)),
                if (record.nextDueDate != null)
                  Text(
                    'Next Due: ${DateFormat('MMM dd, yyyy').format(record.nextDueDate!)}',
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            ),
            onTap: () => _showCareRecordDetails(context, record),
          ),
        );
      },
    );
  }

  void _showCareRecordDetails(BuildContext context, CareRecord record) {
    showModalBottomSheet(
      context: context,
      builder: (context) => CareRecordDetailsSheet(record: record),
    );
  }

  Icon _getCareTypeIcon(CareType type) {
    switch (type) {
      case CareType.feeding:
        return const Icon(Icons.restaurant, color: Colors.orange);
      case CareType.healthCheck:
        return const Icon(Icons.health_and_safety, color: Colors.green);
      case CareType.vaccination:
        return const Icon(Icons.vaccines, color: Colors.blue);
      case CareType.grooming:
        return const Icon(Icons.brush, color: Colors.purple);
      case CareType.exercise:
        return const Icon(Icons.directions_run, color: Colors.red);
      case CareType.medication:
        return const Icon(Icons.medication, color: Colors.pink);
      case CareType.other:
        return const Icon(Icons.pets, color: Colors.grey);
      default:
        return const Icon(Icons.pets, color: Colors.grey);
    }
  }

  Future<void> _showAddCareRecordDialog(BuildContext context) async {
    final careRecord = await showModalBottomSheet<CareRecord>(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: AddCareRecordSheet(petId: widget.pet.id),
      ),
    );

    if (careRecord != null && mounted) {
      try {
        await widget.petService.addCareRecord(widget.pet.id, careRecord);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Care record added successfully')),
          );
          await _refreshPetData();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to add care record')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentPet.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_currentPet.photoUrl != null)
              Image.network(
                _currentPet.photoUrl!,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pet Information',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('Species', _currentPet.species),
                  _buildInfoRow('Breed', _currentPet.breed),
                  _buildInfoRow('Birth Date',
                      DateFormat('MMM dd, yyyy').format(_currentPet.birthDate)),
                  _buildInfoRow('Weight', '${_currentPet.weight} kg'),
                  const SizedBox(height: 24),
                  Text(
                    'Care Records',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  _buildCareRecordsList(_currentPet.careRecords),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddCareRecordDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddCareRecordSheet extends StatefulWidget {
  final String petId;

  const AddCareRecordSheet({
    super.key,
    required this.petId,
  });

  @override
  State<AddCareRecordSheet> createState() => _AddCareRecordSheetState();
}

class _AddCareRecordSheetState extends State<AddCareRecordSheet> {
  final _formKey = GlobalKey<FormState>();
  CareType _selectedType = CareType.feeding;
  final _descriptionController = TextEditingController();
  DateTime _date = DateTime.now();
  DateTime? _nextDueDate;
  final _notesController = TextEditingController();

  Future<void> _selectDate(bool isNextDueDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isNextDueDate ? _nextDueDate ?? DateTime.now() : _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isNextDueDate) {
          _nextDueDate = picked;
        } else {
          _date = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add Care Record',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<CareType>(
              value: _selectedType,
              decoration: const InputDecoration(
                labelText: 'Care Type',
                border: OutlineInputBorder(),
              ),
              items: CareType.values.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type.toString().split('.').last),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedType = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              title: Text('Date: ${DateFormat('yyyy-MM-dd').format(_date)}'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _selectDate(false),
            ),
            ListTile(
              title: Text(_nextDueDate == null
                  ? 'Next Due Date (Optional)'
                  : 'Next Due: ${DateFormat('yyyy-MM-dd').format(_nextDueDate!)}'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _selectDate(true),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notes (Optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final careRecord = CareRecord(
                    id: const Uuid().v4(),
                    petId: widget.petId,
                    type: _selectedType,
                    date: _date,
                    description: _descriptionController.text,
                    nextDueDate: _nextDueDate,
                    notes: _notesController.text.isEmpty
                        ? null
                        : _notesController.text,
                  );
                  Navigator.pop(context, careRecord);
                }
              },
              child: const Text('Save Record'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _notesController.dispose();
    super.dispose();
  }
}

class CareRecordDetailsSheet extends StatelessWidget {
  final CareRecord record;

  const CareRecordDetailsSheet({
    super.key,
    required this.record,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                _getCareTypeIcon(record.type),
                size: 24,
                color: _getCareTypeColor(record.type),
              ),
              const SizedBox(width: 8),
              Text(
                record.type.toString().split('.').last,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Description',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(record.description),
          const SizedBox(height: 16),
          Text(
            'Date',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(DateFormat('MMMM dd, yyyy').format(record.date)),
          if (record.nextDueDate != null) ...[
            const SizedBox(height: 16),
            Text(
              'Next Due Date',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              DateFormat('MMMM dd, yyyy').format(record.nextDueDate!),
              style: const TextStyle(color: Colors.red),
            ),
          ],
          if (record.notes != null) ...[
            const SizedBox(height: 16),
            Text(
              'Notes',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(record.notes!),
          ],
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }

  Color _getCareTypeColor(CareType type) {
    switch (type) {
      case CareType.feeding:
        return Colors.orange;
      case CareType.healthCheck:
        return Colors.green;
      case CareType.vaccination:
        return Colors.blue;
      case CareType.grooming:
        return Colors.purple;
      case CareType.exercise:
        return Colors.red;
      case CareType.medication:
        return Colors.pink;
      case CareType.other:
        return Colors.grey;
    }
  }

  IconData _getCareTypeIcon(CareType type) {
    switch (type) {
      case CareType.feeding:
        return Icons.restaurant;
      case CareType.healthCheck:
        return Icons.health_and_safety;
      case CareType.vaccination:
        return Icons.vaccines;
      case CareType.grooming:
        return Icons.brush;
      case CareType.exercise:
        return Icons.directions_run;
      case CareType.medication:
        return Icons.medication;
      case CareType.other:
        return Icons.pets;
    }
  }
}
