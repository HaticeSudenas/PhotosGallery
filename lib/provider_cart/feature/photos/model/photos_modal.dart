
import 'package:json_annotation/json_annotation.dart';
part 'photos_modal.g.dart';
@JsonSerializable()
class PhotosModal {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

@JsonKey(ignore: true)
  int count=0;
@JsonKey(ignore: true)
  double price=25;

  PhotosModal({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory PhotosModal.fromJson(Map<String, dynamic> json) {
    return _$PhotosModalFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PhotosModalToJson(this);
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhotosModal &&
        other.albumId == albumId &&
        other.id == id &&
        other.title == title &&
        other.url == url &&
        other.thumbnailUrl == thumbnailUrl ;

  }
}