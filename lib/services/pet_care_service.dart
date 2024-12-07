import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/pet.dart';

class PetCareService {
  static const String _petsKey = 'pets';
  final SharedPreferences _prefs;

  PetCareService({required SharedPreferences prefs}) : _prefs = prefs;

  Future<List<Pet>> getPets() async {
    final petsJsonString = _prefs.getString(_petsKey);
    if (petsJsonString == null) return [];

    final List<dynamic> petsJson = jsonDecode(petsJsonString);
    return petsJson.map((json) => Pet.fromJson(json)).toList();
  }

  Future<void> addPet(Pet pet) async {
    final pets = await getPets();
    pets.add(pet);
    await savePets(pets);
  }

  Future<void> updatePet(Pet pet) async {
    final pets = await getPets();
    final index = pets.indexWhere((p) => p.id == pet.id);
    if (index != -1) {
      pets[index] = pet;
      await savePets(pets);
    }
  }

  Future<void> deletePet(String petId) async {
    final pets = await getPets();
    pets.removeWhere((p) => p.id == petId);
    await savePets(pets);
  }

  Future<void> savePets(List<Pet> pets) async {
    final petsJson = pets.map((pet) => pet.toJson()).toList();
    final petsJsonString = jsonEncode(petsJson);
    await _prefs.setString(_petsKey, petsJsonString);
  }

  Future<void> addCareRecord(String petId, CareRecord record) async {
    final pets = await getPets();
    final petIndex = pets.indexWhere((p) => p.id == petId);

    if (petIndex != -1) {
      final pet = pets[petIndex];
      final updatedCareRecords = [...pet.careRecords, record];
      final updatedPet = pet.copyWith(careRecords: updatedCareRecords);
      pets[petIndex] = updatedPet;
      await savePets(pets);
    } else {
      throw Exception('Pet not found');
    }
  }
}
