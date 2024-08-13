class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  bool? activationStatus;
  String? phoneNumber;
  String? confirmationCode;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.password,
      required this.activationStatus,
      required this.phoneNumber,
      required this.confirmationCode});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    activationStatus = json['activationStatus'];
    phoneNumber = json['phoneNumber'];
    confirmationCode = json['confirmationCode'];
  }

  @override
  String toString() {
    return "$id, $name, $email, $password, $activationStatus, $phoneNumber, $confirmationCode";
  }
}
