import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heal_tether_app/view_model/user_viewmodel.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsyncValue = ref.watch(userProvider);
    final searchQuery = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              onChanged: (value) => ref.read(searchProvider.notifier).state = value,
              decoration: InputDecoration(
                hintText: 'Search users...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                prefixIcon: const Icon(Icons.search),  
              ),
            ),
          ),
        ),
      ),
      body: usersAsyncValue.when(
        data: (users) {
           // Filtering users based on search query
          final filteredUsers = users.where((user) => 
            user.name.toLowerCase().contains(searchQuery.toLowerCase())
          ).toList();

          return RefreshIndicator(
            onRefresh: () async {
              ref.refresh(userProvider);
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
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
          );
        },// handles data state
        loading: () => const Center(child: CircularProgressIndicator()), //handles loading state // Show loading spinner while fetching data
        error: (error, stackTrace) => Center(child: Text('Error: $error')), //handles error state // Show error message if API call fails
      ),
    );
  }
}