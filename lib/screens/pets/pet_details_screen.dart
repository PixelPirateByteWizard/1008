import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/pet.dart';
import '../../services/pet_care_service.dart';
import 'package:uuid/uuid.dart';

class PetDetailsScreen extends StatefulWidget {
  final Pet pet;
  final PetCareService petService;

  const PetDetailsScreen({
    Key? key,
    required this.pet,
    required this.petService,
  }) : super(key: key);

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  final DateFormat _dateFormat = DateFormat('MMM d, y');

  Widget _buildInfoRow(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCareRecordsList(List<CareRecord> records) {
    if (records.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pets, size: 48, color: Colors.grey.shade300),
            const SizedBox(height: 16),
            Text(
              'No care records yet',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: _getCareTypeIcon(record.type),
            title: Text(
              record.type.toString().split('.').last,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  record.notes ?? '',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                Text(
                  _dateFormat.format(record.date),
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getCareTypeIcon(CareType type) {
    IconData iconData;
    Color color;

    switch (type) {
      case CareType.feeding:
        iconData = Icons.restaurant;
        color = Colors.orange;
        break;
      case CareType.healthCheck:
        iconData = Icons.favorite;
        color = Colors.red;
        break;
      case CareType.vaccination:
        iconData = Icons.medical_services;
        color = Colors.blue;
        break;
      case CareType.grooming:
        iconData = Icons.brush;
        color = Colors.purple;
        break;
      case CareType.medication:
        iconData = Icons.medication;
        color = Colors.green;
        break;
      case CareType.exercise:
        iconData = Icons.directions_run;
        color = Colors.indigo;
        break;
      default:
        iconData = Icons.pets;
        color = Colors.grey;
    }

    return CircleAvatar(
      backgroundColor: color.withOpacity(0.1),
      child: Icon(iconData, color: color),
    );
  }

  void _addCareRecord() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _AddCareRecordSheet(
        petId: widget.pet.id,
        petService: widget.petService,
      ),
    ).then((_) {
      // Reload pet details
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  widget.pet.photoUrl != null
                      ? Image.network(
                          widget.pet.photoUrl!,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: Colors.grey.shade200,
                          child: Icon(
                            Icons.pets,
                            size: 80,
                            color: Colors.grey.shade400,
                          ),
                        ),
                  // Add gradient overlay
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Text(
                      widget.pet.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pet Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Info rows with spacing
                  ...[
                    _buildInfoRow('Species', widget.pet.species),
                    const SizedBox(height: 8),
                    _buildInfoRow('Breed', widget.pet.breed),
                    const SizedBox(height: 8),
                    _buildInfoRow(
                        'Birth Date', _dateFormat.format(widget.pet.birthDate)),
                    const SizedBox(height: 8),
                    _buildInfoRow('Weight', '${widget.pet.weight} kg'),
                  ],
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Care Records',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: _addCareRecord,
                        icon: const Icon(Icons.add),
                        label: const Text('Add Record'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildCareRecordsList(widget.pet.careRecords),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddCareRecordSheet extends StatefulWidget {
  final String petId;
  final PetCareService petService;

  const _AddCareRecordSheet({
    Key? key,
    required this.petId,
    required this.petService,
  }) : super(key: key);

  @override
  State<_AddCareRecordSheet> createState() => _AddCareRecordSheetState();
}

class _AddCareRecordSheetState extends State<_AddCareRecordSheet> {
  final _formKey = GlobalKey<FormState>();
  CareType _selectedType = CareType.feeding;
  final _descriptionController = TextEditingController();
  final _notesController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _saveRecord() async {
    if (_formKey.currentState!.validate()) {
      final uuid = Uuid();
      final record = CareRecord(
        id: uuid.v4(),
        petId: widget.petId,
        type: _selectedType,
        date: _selectedDate,
        description: _descriptionController.text,
        notes: _notesController.text,
      );

      await widget.petService.addCareRecord(widget.petId, record);
      if (mounted) {
        Navigator.pop(context);
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
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Care Record',
              style: TextStyle(
                fontSize: 24,
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
                setState(() {
                  _selectedType = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: _selectDate,
              child: Text(
                'Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate)}',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a description';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notes',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some notes';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveRecord,
              child: const Text('Save Record'),
            ),
            const SizedBox(height: 16),
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
