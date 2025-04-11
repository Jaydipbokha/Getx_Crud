import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/user_model.dart';

class DashboardController extends GetxController {
  final GetStorage storage = GetStorage();

  List<UserModel> users = [];

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController area = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController country = TextEditingController();

  final RxString gender = ''.obs;
  final RxInt editingIndex = (-1).obs;

  Future<void> loadUsers() async {
    final String? data = storage.read('users');
    if (data != null) {
      final List<dynamic> jsonData = jsonDecode(data);
      users = jsonData.map((e) => UserModel.fromJson(e)).toList();
      update(['storedUserData', 'isPressButton']);
    }
  }

  Future<void> saveUsers() async {
    final List<Map<String, dynamic>> data = users.map((e) => e.toJson()).toList();
    await storage.write('users', jsonEncode(data));
    await loadUsers();
     update(['storedUserData', 'isPressButton']);
  }

  Future<void> addUser(UserModel user) async {
    users.add(user);
    await saveUsers();
    await loadUsers();
      update(['storedUserData', 'isPressButton']);
  }

  Future<void> updateUser(int index, UserModel updatedUser) async {
    users[index] = updatedUser;
    await saveUsers();
     await loadUsers();
       update(['storedUserData', 'isPressButton']);
  }

  Future<void> deleteUser(int index) async {
    users.removeAt(index);
    await saveUsers();
     await loadUsers();
       update(['storedUserData', 'isPressButton']);
  }

  UserModel getUser(int index) {
    return users[index];
  }

  void clearForm() {
    firstName.clear();
    lastName.clear();
    mobile.clear();
    dob.clear();
    address.clear();
    area.clear();
    city.clear();
    state.clear();
    country.clear();
    gender.value = '';
    editingIndex.value = -1;
  }

  void fillForm(UserModel user) {
    firstName.text = user.firstName;
    lastName.text = user.lastName;
    mobile.text = user.mobile;
    dob.text = user.dob;
    gender.value = user.gender;
    address.text = user.address;
    area.text = user.area;
    city.text = user.city;
    state.text = user.state;
    country.text = user.country;
  }

  @override
  void onInit() {
    loadUsers();
    super.onInit();
  }
}
