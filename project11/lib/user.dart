import 'package:json_annotation/json_annotation.dart';

// part 'user.g.dart';

// @JsonSerializable(explicitToJson: true, anyMap: true)
class User {

  // @JsonKey(required: true, disallowNullValue: true)
  final int? id;

  // @JsonKey(required: true, disallowNullValue: true)
  final String? name;

  // @JsonKey(required: true, disallowNullValue: true)
  final String? email;
  final DateTime? createdAt;

  User({this.id, this.name, this.email, this.createdAt,});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: _parseInt(json['id']),
      name: _parseString(json['name']), 
      email: _parseString(json['email']),
      createdAt: _parseDateTime(
      json['createdAt'] ?? json['createdAt'],
      ),
    );
  }

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    if (value is double) return value.toInt();
    return null;
  }

  static String? _parseString(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    return value.toString();
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) {
      try {
        return DateTime.parse(value);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  // perbaikan method toJson yang benar menggunakan field instance, bukan parameter json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  // tambahkan method toString untuk debugging
  @override
  String toString() {
    return 'SafeUser{id: $id, name: $name, email: $email, createdAt: $createdAt}';
  }

  // tambahkan method copywith untuk immutability 
  User copyWith({int? id, String? name, String? email, DateTime? createdAt,}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  //tambahkan method untuk validasi
  bool get isValid => id != null && name != null && name!.isNotEmpty;

  // tambahkan method untuk compare objects
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          createdAt == other.createdAt;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ email.hashCode ^ createdAt.hashCode;

  // @JsonKey(
  //   name: 'createdAt',
  //   required: true,
  //   fromJson: _parseDateTime,
  //   toJson: _dateTimeToJson,
  // )
  // final DateTime createdAt;

  // User({
  //   required this.id, 
  //   required this.name, 
  //   required this.email,
  //   required this.createdAt,
  //   });

  
  // static DateTime _parseDateTime(dynamic value) {
  //   if (value == null) return DateTime.now();
  //   if (value is DateTime) return value;
  //   if (value is String) return DateTime.parse(value);
  //   return DateTime.now();
  // }

  // static String _dateTimeToJson(DateTime dateTime) => dateTime.toIso8601String();
  
  // // konversi dari JSON ke object dart
  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json); 
    
  // // konversi dari object dart ke JSON
  // Map<String, dynamic> toJson() => _$UserToJson(this);

}