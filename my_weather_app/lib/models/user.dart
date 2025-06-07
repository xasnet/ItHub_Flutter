
class User {
  String id;
  String firstName;
  String lastName;
  String location;
  String avatarUrl;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.location,
    required this.avatarUrl,
  });

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      location: json['location'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'location': location,
      'avatarUrl': avatarUrl,
    };
  }

  User copyWith({
    String? firstName,
    String? lastName,
    String? location,
    String? avatarUrl,
  }) {
    return User(
      id: id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      location: location ?? this.location,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
