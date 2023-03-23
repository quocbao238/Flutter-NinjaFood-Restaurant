class UserModel {
  String uid;
  String? fullName;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? photoUrl;
  String? address;

  UserModel({
    required this.uid,
    this.fullName,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.photoUrl,
    this.address,
  });

  UserModel createUserEmail(String uid, String email) {
    return UserModel(uid: uid, email: email);
  }

  UserModel.fromMap(Map<String, dynamic> data)
      : uid = data['uid'],
        fullName = data['fullName'],
        firstName = data['firstName'],
        lastName = data['lastName'],
        phoneNumber = data['phoneNumber'],
        email = data['email'],
        photoUrl = data['photoUrl'],
        address = data['address'];

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fullName': fullName,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'photoUrl': photoUrl,
      'address': address,
    };
  }

  copyWith({
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
      fullName: fullName ?? this.fullName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      address: address ?? this.address,
    );
  }
}
