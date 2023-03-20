import 'package:get/get.dart';
import 'package:appwrite/appwrite.dart';
import 'package:ninjafood/app/constants/contains.dart';

class AppWriteProvider extends GetxService {
  late final client;
  late final account;
  late final database;
  late final storageDatabase;
  late final realtimeDatabase;

  void call() {
    client = Client()
      ..setEndpoint(AppwriteConstants.endPoint)
      ..setProject(AppwriteConstants.projectId)
      ..setSelfSigned(status: true);
    account = Account(client);
    database = Databases(client);
    storageDatabase = Storage(client);
    realtimeDatabase = Realtime(client);
  }

  Account get getAccount => account;
  Databases get getDatabase => database;
  Storage get getstorageDatabase => storageDatabase;
  Realtime get getRealtimeDatabase => getRealtimeDatabase;
}
