import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ny_transit/data/models/user_model.dart';
import 'package:ny_transit/services/api/user_api_service.dart';

final userProvider = Provider<UserApiService>((ref) => UserApiService());

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
