import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ny_transit/data/models/vehicule_model.dart';
import 'package:ny_transit/services/api/vehicule_api_service.dart';

final vehiculeProvider =
    Provider<VehiculeApiService>((ref) => VehiculeApiService());

final vehiculeDataProvider = FutureProvider<List<VehiculeModel>>((ref) async {
  return ref.watch(vehiculeProvider).getVehicules();
});

final vehiculeModeleProvider = FutureProvider<List<String>>((ref) async {
  return ref.watch(vehiculeProvider).getVehiculeModeles();
});
