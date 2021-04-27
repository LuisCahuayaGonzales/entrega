import 'package:evalm/data/models/user.dart';
import 'package:evalm/data/services/user.service.dart';
import 'package:rxdart/subjects.dart';

class MainBloc extends Object {
  // ignore: close_sinks
  final BehaviorSubject<User> _loggedUser = BehaviorSubject<User>();
  Stream<User> get loggedUser => _loggedUser;

  Future<User> signInWithLocal(String username, String password) async {
    AuthService service = AuthService();
    User user = await service.login(username, password);
    _loggedUser.sink.add(user);
    return user;
  }

}
