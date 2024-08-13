import 'dart:convert';

import 'package:http/http.dart';
import 'package:ny_transit/data/models/vehicule_model.dart';
import 'package:ny_transit/services/api/constants/api_constants.dart';

class VehiculeApiService {
  Future<List<VehiculeModel>> getVehicules() async {
    Response response = await get(Uri.parse(VehiculeApiConstants().endpoint));
    if (response.statusCode == 200) {
      final List vehicules = jsonDecode(response.body);
      return vehicules.map((e) => VehiculeModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<String>> getVehiculeModeles() async {
    final vehicules = await getVehicules();
    final List<String> modeles = [];
    for (var v in vehicules) {
      if (!modeles.contains(v.modele)) {
        modeles.add(v.modele.toString());
      }
    }
    return modeles;
  }
}
