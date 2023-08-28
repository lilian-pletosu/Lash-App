import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  late final User? _user = FirebaseAuth.instance.currentUser;

  String getUsername() {
    return _user?.displayName ?? 'nul';
  }

  Future<void> updateUserName(String username) async {
    await _user?.updateDisplayName(username);
  }
}
