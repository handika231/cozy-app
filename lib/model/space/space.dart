import 'package:freezed_annotation/freezed_annotation.dart';

part 'space.freezed.dart';
part 'space.g.dart';

@freezed
class Space with _$Space {
  factory Space({
    int? id,
    String? name,
    String? city,
    String? country,
    int? price,
    @JsonKey(name: 'image_url') String? imageUrl,
    int? rating,
    String? address,
    String? phone,
    @JsonKey(name: 'map_url') String? mapUrl,
    List<String>? photos,
    @JsonKey(name: 'number_of_kitchens') int? numberOfKitchens,
    @JsonKey(name: 'number_of_bedrooms') int? numberOfBedrooms,
    @JsonKey(name: 'number_of_cupboards') int? numberOfCupboards,
  }) = _Space;

  factory Space.fromJson(Map<String, dynamic> json) => _$SpaceFromJson(json);
}
