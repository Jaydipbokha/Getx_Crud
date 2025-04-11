class UserModel {
  String firstName;
  String lastName;
  String mobile;
  String dob;
  String gender;
  String address;
  String area;
  String city;
  String state;
  String country;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.dob,
    required this.gender,
    required this.address,
    required this.area,
    required this.city,
    required this.state,
    required this.country,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      mobile: json['mobile'],
      dob: json['dob'],
      gender: json['gender'],
      address: json['address'],
      area: json['area'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobile,
      'dob': dob,
      'gender': gender,
      'address': address,
      'area': area,
      'city': city,
      'state': state,
      'country': country,
    };
  }
}
