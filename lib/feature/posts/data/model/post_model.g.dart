// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      title: json['title'] as String,
      userId: json['user_id'] as int,
      body: json['body'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'id': instance.id,
      'user_id': instance.userId,
    };
