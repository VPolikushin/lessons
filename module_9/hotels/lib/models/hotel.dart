import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable()
class HotelPreview {
  final String uuid;
  final String name;
  final String poster;

  HotelPreview({required this.uuid, required this.name, required this.poster});

  factory HotelPreview.fromJson(Map<String, dynamic> json) =>
      _$HotelPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$HotelPreviewToJson(this);
}

@JsonSerializable()
class HotelDescription {
  final String uuid;
  final String name;
  final String poster;
  final HotelAddress address;
  final double price;
  final double rating;
  final HotelServices services;
  final List<String> photos;

  HotelDescription({required this.uuid,
                    required this.name,
                    required this.poster,
                    required this.address,
                    required this.price,
                    required this.rating,
                    required this.services,
                    required this.photos
  });

  factory HotelDescription.fromJson(Map<String, dynamic> json) =>
      _$HotelDescriptionFromJson(json);
  Map<String, dynamic> toJson() => _$HotelDescriptionToJson(this);
}

@JsonSerializable()
class HotelAddress {
  final String country;
  final String street;
  final String city;

  @JsonKey(name: 'zip_code')
  final int zipCode;
  final HotelCoords coords;

  HotelAddress(this.country, this.street, this.city, this.zipCode, this.coords);


  factory HotelAddress.fromJson(Map<String, dynamic> json) =>
      _$HotelAddressFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAddressToJson(this);
}

@JsonSerializable()
class HotelCoords {
  final double lat;
  final double lan;

  HotelCoords(this.lat, this.lan);

  factory HotelCoords.fromJson(Map<String, dynamic> json) =>
      _$HotelCoordsFromJson(json);
  Map<String, dynamic> toJson() => _$HotelCoordsToJson(this);
}

@JsonSerializable()
class HotelServices {
  final List<String> free;
  final List<String> paid;

  HotelServices(this.free, this.paid);

  factory HotelServices.fromJson(Map<String, dynamic> json) =>
      _$HotelServicesFromJson(json);
  Map<String, dynamic> toJson() => _$HotelServicesToJson(this);
}
