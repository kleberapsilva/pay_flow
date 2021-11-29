import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../entities/user.dart';
import 'i_login_with_google_usecase.dart';

class LoginWithGoogleUsecase implements ILoginWithGoogleUsecase {
  @override
  Future<Either<Exception, User>?> call() async {
    try {
      final googleSignIn = GoogleSignIn(scopes: ['email']);
      googleSignIn.signOut();
      final userGoogle = await googleSignIn.signIn();

      if (userGoogle != null) {
        final user = User(
          id: userGoogle.id,
          name: userGoogle.displayName!,
          imageUrl: userGoogle.photoUrl,
          email: userGoogle.email,
        );
        log('$user');
        return Right(user);
      } else {
        return null;
      }
    } catch (e) {
      return Left(Exception('$e'));
    }
  }
}
