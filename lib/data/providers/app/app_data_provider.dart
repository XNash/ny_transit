import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ny_transit/data/providers/vehicule/vehicule_provider.dart';

// Home page
final appSelectedModeleProvider = StateProvider<String>((ref) {
  final vehiculeModeles = ref.watch(vehiculeModeleProvider);
  return vehiculeModeles.when(
      data: (vehiculeModeles) => vehiculeModeles[0],
      error: (e, s) => e.toString(),
      loading: () => '');
});
