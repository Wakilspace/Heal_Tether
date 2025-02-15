import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../service/api_service.dart';
import '../model/user_model.dart';

final userProvider = FutureProvider<List<UserModel>>((ref) async {
  return ApiService().fetchUsers();
});