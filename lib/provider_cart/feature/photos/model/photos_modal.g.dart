// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotosModal _$PhotosModalFromJson(Map<String, dynamic> json) => PhotosModal(
      albumId: json['albumId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$PhotosModalToJson(PhotosModal instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
