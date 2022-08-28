class UserModel {
  const UserModel({
    required this.email,
    required this.name,
    this.id = '123',
  });

  final String email;
  final String id;
  final String name;
}
