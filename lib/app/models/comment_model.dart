class CommentModel {
  String comment;

  String commentId;

  String userId;

  int productId;

  String userName;

  String userImage;

  String date;

  CommentModel(
      {required this.comment,
      required this.commentId,
      required this.userId,
      required this.productId,
      required this.userName,
      required this.userImage,
      required this.date});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      comment: json['comment'] ?? '',
      commentId: json['commentId'] ?? '',
      userId: json['userId'] ?? '',
      productId: json['productId'] ?? '',
      userName: json['userName'] ?? '',
      userImage: json['userImage'] ?? '',
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['comment'] = this.comment;

    data['commentId'] = this.commentId;

    data['userId'] = this.userId;

    data['productId'] = this.productId;

    data['userName'] = this.userName;

    data['userImage'] = this.userImage;

    data['date'] = this.date;

    return data;
  }
}
