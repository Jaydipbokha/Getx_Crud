import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../dashboard/controller/dashboard_controller.dart';
import '../../dashboard/model/user_model.dart';

class UsersView extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  final bool isEditing;
  final int editingIndex;

  UsersView({super.key, this.isEditing = false, this.editingIndex = -1});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  final DashboardController controller = Get.find();
  final _formKey = GlobalKey<FormState>();

@override
void initState() {
  super.initState();
  if (widget.isEditing) {
    final user = controller.getUser(widget.editingIndex);
    controller.fillForm(user);
  } else {
    controller.clearForm(); // Optional: safety check
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Edit User' : 'Add User'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField(controller.firstName, 'First Name'),
              buildTextField(controller.lastName, 'Last Name'),
              buildTextField(controller.mobile, 'Mobile No',
                  keyboardType: TextInputType.phone),
              buildDateField(controller.dob, 'Date of Birth'),
              Obx(() => Row(
                    children: [
                      const Text('Gender:'),
                      Radio<String>(
                        value: 'Male',
                        groupValue: controller.gender.value,
                        onChanged: (val) => controller.gender.value = val!,
                      ),
                      const Text('Male'),
                      Radio<String>(
                        value: 'Female',
                        groupValue: controller.gender.value,
                        onChanged: (val) => controller.gender.value = val!,
                      ),
                      const Text('Female'),
                    ],
                  )),
              buildTextField(controller.address, 'Address'),
              buildTextField(controller.area, 'Area'),
              buildTextField(controller.city, 'City'),
              buildTextField(controller.state, 'State'),
              buildTextField(controller.country, 'Country'),
              const SizedBox(height: 20),
              GetBuilder<DashboardController>(
                  id: 'isPressButton',
                  builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate() &&
                            controller.gender.value.isNotEmpty) {
                          final user = UserModel(
                            firstName: controller.firstName.text,
                            lastName: controller.lastName.text,
                            mobile: controller.mobile.text,
                            dob: controller.dob.text,
                            gender: controller.gender.value,
                            address: controller.address.text,
                            area: controller.area.text,
                            city: controller.city.text,
                            state: controller.state.text,
                            country: controller.country.text,
                          );

                          if (widget.isEditing && widget.editingIndex != -1) {
                            controller.updateUser(widget.editingIndex, user);
                          } else {
                            controller.addUser(user);
                          }

                          controller.clearForm();
                          Get.back(); // Navigate back to Dashboard
                        }
                      },
                      child: Container(
                        width: Get.width,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(7))),
                        child: Center(
                          child: Text(
                            widget.isEditing ? 'Update User' : 'Add User',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        validator: (val) =>
            val == null || val.isEmpty ? '$label is required' : null,
      ),
    );
  }

  Widget buildDateField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          suffixIcon: const Icon(Icons.calendar_today),
        ),
        onTap: () async {
          DateTime? picked = await showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (picked != null) {
            controller.text = DateFormat('yyyy-MM-dd').format(picked);
          }
        },
        validator: (val) =>
            val == null || val.isEmpty ? '$label is required' : null,
      ),
    );
  }
}
