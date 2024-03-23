import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_note_app/repositories/core_repo.dart';

class AuthRepository extends CoreRepo {
  Future<RepoResponse> signup({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  }) async {
    //
    try {
      //
      final response = await supabaseAuth.signUp(password: password, email: email, data: data);

      if(response.user != null){
        return RepoResponse(responseStatus: RepoResponseStatus.success, data: response.user);
      }

      return RepoResponse(responseStatus: RepoResponseStatus.error);
    } on AuthException catch (e) {
      print(e);
      return RepoResponse(responseStatus: RepoResponseStatus.error);
    }catch (e){
      return RepoResponse(responseStatus: RepoResponseStatus.unknown);
    }
  }
}


