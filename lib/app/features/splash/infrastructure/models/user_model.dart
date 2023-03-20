class UserModel {
  final String email;
  final String name;
  final String uid;
  const UserModel({
    required this.email,
    required this.name,
    required this.uid,
  });

  UserModel.createUserByEmail({
    required this.email,
    required this.name,
    required this.uid,
  });

  UserModel copyWith({String? email, String? name, String? uid}) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'name': name});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      uid: map['\$id'] ?? '',
    );
  }

  @override
  String toString() {
    return 'UserModel(email: $email, name: $name, )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.email == email &&
        other.name == name &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return email.hashCode ^ name.hashCode ^ uid.hashCode;
  }
}
