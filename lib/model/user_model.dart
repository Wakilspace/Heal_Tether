class UserModel {
  final int id;
  final String name;
  final String email;
  final String avatar;

  UserModel({required this.id, required this.name, required this.email, required this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      avatar: 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(json['name'])}&background=random',
    );
  }
}