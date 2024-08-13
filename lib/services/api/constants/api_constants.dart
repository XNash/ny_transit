import 'package:flutter/cupertino.dart';

abstract class ApiConstants {
  @protected
  String? endpoint;
}

final class UserApiConstants extends ApiConstants {
  @override
  String get endpoint => "http://127.0.0.1:3000/users";
}

final class VehiculeApiConstants extends ApiConstants {
  @override
  String get endpoint => "http://127.0.0.1:3000/vehicules";
}
