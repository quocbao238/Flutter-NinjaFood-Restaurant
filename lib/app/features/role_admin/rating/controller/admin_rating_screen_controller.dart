import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/models/comment_model.dart';
import 'package:ninjafood/app/services/database_service/database_service.dart';

class AdminRatingController extends BaseController {
  final DatabaseService _databaseService = DatabaseService.instance;
  final ratings = <CommentModel>[].obs;

  @override
  void onInit() {
    _databaseService
        .listenRating()
        .listen((QuerySnapshot<Map<String, dynamic>> event) {
      final List<CommentModel> _result =
          event.docs.map((e) => CommentModel.fromJson(e.data())).toList();
      ratings.assignAll(_result);
    });
    super.onInit();
  }
}
