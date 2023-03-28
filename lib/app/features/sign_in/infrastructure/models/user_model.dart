import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String uid;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? photoUrl;
  String? address;

  UserModel({
    required this.uid,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.photoUrl,
    this.address,
  });

  static UserModel createUserByAuthUser({required User authUser}) {
    return UserModel(
        uid: authUser.uid,
        email: authUser.email,
        photoUrl: authUser.photoURL,
        phoneNumber: authUser.phoneNumber,
        firstName: authUser.displayName);
  }

  UserModel.fromJson(Map<String, dynamic> data)
      : uid = data['uid'] ?? '',
        firstName = data['firstName'] ?? '',
        lastName = data['lastName'] ?? '',
        phoneNumber = data['phoneNumber'] ?? '',
        email = data['email'] ?? '',
        photoUrl = data['photoUrl'] ?? '',
        address = data['address'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'photoUrl': photoUrl,
      'address': address,
    };
  }

  UserModel copyWith({
    String? uid,
    String? fullName,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? photoUrl,
    String? address,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      address: address ?? this.address,
    );
  }
}
