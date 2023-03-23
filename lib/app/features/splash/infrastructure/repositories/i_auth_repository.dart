import 'package:fpdart/fpdart.dart';
import 'package:ninjafood/app/constants/contains.dart';
import 'package:appwrite/models.dart' as models;

abstract class IAuthRepository {
  Future<Either<Failure, models.Account>> signUp({required String email, required String password, required String name});

  Future<Either<Failure, models.Session>> login({required String email, required String password});

  Future<models.Account?> currentUserAccount();


  Future<Either<Failure, bool>> logout();

}
