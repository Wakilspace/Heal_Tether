import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heal_tether_app/view_model/user_viewmodel.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsyncValue = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Users List')),
      body: usersAsyncValue.when(
        data: (users) => RefreshIndicator(
          onRefresh: () async {
            ref.refresh(userProvider);
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(user.avatar),
                    onBackgroundImageError: (_, __) => const Icon(Icons.person, size: 30),
                  ),
                  title: Text(user.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Text(user.email, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                ),
              );
            },
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}