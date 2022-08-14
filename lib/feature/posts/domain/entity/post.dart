import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post({
    required this.title,
    required this.userId,
    required this.body,
    required this.id,
  });

  final String title;
  final String body;
  final int id;
  final int userId;

  @override
  List<Object?> get props => [id, title, body, userId];
}
