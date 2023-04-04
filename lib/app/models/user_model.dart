import 'package:firebase_auth/firebase_auth.dart';

const ROLE_USER = 'role_user';
const ROLE_ADMIN = 'role_admin';

const CREATE_TYPE_LOGIN_TYPE_EMAIL = 'email';
const CREATE_TYPE_LOGIN_TYPE_GOOGLE = 'google';
const CREATE_TYPE_LOGIN_TYPE_FACEBOOK = 'facebook';

class UserModel {
  String uid;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? photoUrl;
  String? address;
  String? role;
  String? createType;
  String? fcmToken;

  UserModel({
    required this.uid,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.photoUrl,
    this.address,
    this.role,
    this.createType,
    this.fcmToken
  });

  static UserModel createUserByAuthUser(
      {required User authUser, required createType}) {
    return UserModel(
      uid: authUser.uid,
      email: authUser.email,
      photoUrl: authUser.photoURL,
      phoneNumber: authUser.phoneNumber,
      firstName: authUser.displayName,
      role: ROLE_USER,
      createType: createType
    );
  }

  static UserModel createAdminByAuthUser(
      {required User authUser, required createType}) {
    return UserModel(
      uid: authUser.uid,
      email: authUser.email,
      photoUrl: authUser.photoURL,
      phoneNumber: authUser.phoneNumber,
      firstName: authUser.displayName,
      role: ROLE_ADMIN,
      createType: createType,

    );
  }

  bool isUser() => role == ROLE_USER;

  bool isAdmin() => role == ROLE_ADMIN;

  UserModel.fromJson(Map<String, dynamic> data)
      : uid = data['uid'] ?? '',
        firstName = data['firstName'] ?? '',
        lastName = data['lastName'] ?? '',
        phoneNumber = data['phoneNumber'] ?? '',
        email = data['email'] ?? '',
        photoUrl = data['photoUrl'] ?? '',
        address = data['address'] ?? '',
        role = data['role'] ?? '',
        fcmToken =  data['fcmToken'] ?? '',
        createType = data['createType'] ?? '';

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'photoUrl': photoUrl,
      'address': address,
      'role': role,
      'createType': createType,
      'fcmToken': fcmToken,
    };
  }

  UserModel copyWith({
    String? fullName,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? photoUrl,
    String? address,
  }) {
    return UserModel(
      uid: this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      address: address ?? this.address,
      role: this.role,
      createType: this.createType,
      fcmToken: this.fcmToken,
    );
  }
}
