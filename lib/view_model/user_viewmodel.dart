import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../service/api_service.dart';
import '../model/user_model.dart';

// Riverpod provider to manage fetching users
final userProvider = FutureProvider<List<UserModel>>((ref) async {
  return ApiService().fetchUsers();
});

// Riverpod provider to manage search query state
final searchProvider = StateProvider<String>((ref) => "");