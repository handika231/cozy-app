// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Space _$$_SpaceFromJson(Map<String, dynamic> json) => _$_Space(
      id: json['id'] as int?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      price: json['price'] as int?,
      imageUrl: json['image_url'] as String?,
      rating: json['rating'] as int?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      mapUrl: json['map_url'] as String?,
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
      numberOfKitchens: json['number_of_kitchens'] as int?,
      numberOfBedrooms: json['number_of_bedrooms'] as int?,
      numberOfCupboards: json['number_of_cupboards'] as int?,
    );

Map<String, dynamic> _$$_SpaceToJson(_$_Space instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'country': instance.country,
      'price': instance.price,
      'image_url': instance.imageUrl,
      'rating': instance.rating,
      'address': instance.address,
      'phone': instance.phone,
      'map_url': instance.mapUrl,
      'photos': instance.photos,
      'number_of_kitchens': instance.numberOfKitchens,
      'number_of_bedrooms': instance.numberOfBedrooms,
      'number_of_cupboards': instance.numberOfCupboards,
    };
