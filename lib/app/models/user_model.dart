import 'package:firebase_auth/firebase_auth.dart';

const ROLE_USER = 'role_user';
const ROLE_ADMIN = 'role_admin';

enum UserType {
  Sliver('Member Sliver', 0),
  Gold('Member Gold', 1),
  Platinum('Member Platinum', 2),
  Diamond('Member Diamond', 3),
  Owners('Restaurant Owners', 4);

  final String name;
  final int json;

  const UserType(this.name, this.json);
}

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
  UserType? userType;
  List<int> favoriteIds;

  UserModel(
      {required this.uid,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.photoUrl,
      this.address,
      this.role,
      this.createType,
      this.userType,
      required this.favoriteIds,
      this.fcmToken});

  static UserModel createUserByAuthUser({required User authUser, required createType}) {
    return UserModel(
        uid: authUser.uid,
        email: authUser.email,
        photoUrl: authUser.photoURL,
        phoneNumber: authUser.phoneNumber,
        firstName: authUser.displayName,
        role: ROLE_USER,
        favoriteIds: [],
        userType: UserType.Sliver,
        createType: createType);
  }

  static UserModel createAdminByAuthUser({required User authUser, required createType}) {
    return UserModel(
      uid: authUser.uid,
      email: authUser.email,
      photoUrl: authUser.photoURL,
      phoneNumber: authUser.phoneNumber,
      firstName: authUser.displayName,
      userType: UserType.Owners,
      role: ROLE_ADMIN,
      favoriteIds: [],
      createType: createType,
    );
  }

  bool isUser() => role == ROLE_USER;

  bool isAdmin() => role == ROLE_ADMIN;

  String getName() => (firstName ?? '') + ' ' + (lastName ?? '');

  UserModel.fromJson(Map<String, dynamic> data)
      : uid = data['uid'] ?? '',
        firstName = data['firstName'] ?? '',
        lastName = data['lastName'] ?? '',
        phoneNumber = data['phoneNumber'] ?? '',
        email = data['email'] ?? '',
        photoUrl = data['photoUrl'] ?? '',
        address = data['address'] ?? '',
        role = data['role'] ?? '',
        fcmToken = data['fcmToken'] ?? '',
        createType = data['createType'] ?? '',
        favoriteIds = List<int>.from(data['favoriteIds'] ?? []),
        userType = UserType.values[data['userType'] ?? 0];

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
      'favoriteIds': favoriteIds,
      'userType': userType?.json,
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
    String? fcmToken,
    UserType? userType,
    List<int>? favoriteIds,
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
      fcmToken: fcmToken ?? this.fcmToken,
      favoriteIds: favoriteIds ?? this.favoriteIds,
      userType: userType ?? this.userType,
    );
  }
}
