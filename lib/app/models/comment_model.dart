class CommentModel {
  final String uid;
  final String userId;
  final String userName;
  final String userImage;
  final String createAt;
  final double rating;
  final String? comment;

  CommentModel(
      {required this.uid,
      required this.userId,
      required this.userName,
      required this.userImage,
      required this.createAt,
      required this.comment,
      required this.rating});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
        comment: json['comment'] as String,
        uid: json['uid'] as String,
        userId: json['userId'] as String,
        userName: json['userName'] as String,
        userImage: json['userImage'] as String,
        createAt: json['createAt'] as String,
        rating: double.parse(json['rating'].toString()));
  }

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
      'uid': uid,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'createAt': createAt,
      'rating': rating
    };
  }
}
