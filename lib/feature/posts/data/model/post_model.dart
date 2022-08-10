import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  const PostModel({
    required this.title,
    required this.userId,
    required this.body,
    required this.id,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  final String title;
  final String body;
  final int id;
  @JsonKey(name: 'user_id')
  final int userId;
}
