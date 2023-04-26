import 'package:firebase_auth/firebase_auth.dart';
import 'package:ninjafood/app/models/cart_model.dart';
import 'package:ninjafood/app/models/history_model.dart';

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
  double? serviceFee = 6.0;
  List<int> favoriteIds;
  List<CartModel> carts;
  List<HistoryOrderModel> historyOrders;
  List<String> commentIds = [];

  UserModel(
      {required this.uid,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.photoUrl,
      this.address,
      required this.historyOrders,
      this.role,
      this.createType,
      this.userType,
      required this.carts,
      required this.commentIds,
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
        historyOrders: [],
        favoriteIds: [],
        carts: [],
        userType: UserType.Sliver,
        commentIds: [],
        createType: createType);
  }

  static UserModel createAdminByAuthUser({required User authUser, required createType}) {
    return UserModel(
      uid: authUser.uid,
      historyOrders: [],
      email: authUser.email,
      photoUrl: authUser.photoURL,
      phoneNumber: authUser.phoneNumber,
      firstName: authUser.displayName,
      userType: UserType.Owners,
      role: ROLE_ADMIN,
      favoriteIds: [],
      commentIds: [],
      carts: [],
      createType: createType,
    );
  }

  bool isUser() => role == ROLE_USER;

  bool isAdmin() => role == ROLE_ADMIN;

  String getName() => (firstName ?? '') + ' ' + (lastName ?? '');

  double get getServiceFee => serviceFee ?? 0.0;

  UserModel.fromJson(Map<String, dynamic> data)
      : uid = data['uid'] ?? '',
        firstName = data['firstName'] ?? '',
        lastName = data['lastName'] ?? '',
        phoneNumber = data['phoneNumber'] ?? '',
        email = data['email'] ?? '',
        photoUrl = data['photoUrl'] ?? '',
        address = data['address'] ?? '',
        role = data['role'] ?? '',
        commentIds = List<String>.from(data['commentIds'] ?? []),
        fcmToken = data['fcmToken'] ?? '',
        createType = data['createType'] ?? '',
        favoriteIds = List<int>.from(data['favoriteIds'] ?? []),
        historyOrders =
            List<HistoryOrderModel>.from(data['historyOrders']?.map((x) => HistoryOrderModel.fromJson(x)) ?? []),
        carts = List<CartModel>.from(data['carts']?.map((x) => CartModel.fromJson(x)) ?? []),
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
      'commentIds': commentIds,
      'historyOrders': historyOrders.map((x) => x.toJson()).toList(),
      'carts': carts.map((x) => x.toJson()).toList(),
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
    List<CartModel>? carts,
    String? fcmToken,
    List<HistoryOrderModel>? historyOrders,
    UserType? userType,
    List<int>? favoriteIds,
    List<String>? commentIds,
  }) {
    return UserModel(
      uid: this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      address: address ?? this.address,
      historyOrders: historyOrders ?? this.historyOrders,
      role: this.role,
      createType: this.createType,
      fcmToken: fcmToken ?? this.fcmToken,
      favoriteIds: favoriteIds ?? this.favoriteIds,
      commentIds: commentIds ?? this.commentIds,
      userType: userType ?? this.userType,
      carts: carts ?? this.carts,
    );
  }
}
