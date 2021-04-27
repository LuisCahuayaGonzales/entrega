import 'package:evalm/bloc/main.bloc.dart';
import 'package:evalm/data/models/user.dart';
import 'package:evalm/provider/main.provider.dart';
import 'package:evalm/screens/home.screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameCtrl = TextEditingController();
  final TextEditingController _pwdCtrl = TextEditingController();
  //final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool isSignIn = false;
  bool google = false;

  String _error;
  bool _hidePassword = true;


  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Ingresar'),
            SizedBox(height: 16),
            _userEntry(),
            SizedBox(height: 16),
            _pwdEntry(),
            SizedBox(height: 16),
            _error == null
                ? Text('')
                : Text(
                    _error,
                    style: TextStyle(color: Colors.red),
                  ),
            SizedBox(height: 16),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: _cancelButton()),
                SizedBox(width: 16),
                Expanded(child: _submitButton()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _userEntry() {
    final node = FocusScope.of(context);
    return Container(
      child: TextField(
        controller: _usernameCtrl,
        onEditingComplete: node.nextFocus,
        keyboardType: TextInputType.emailAddress,
        decoration: _intpuDecoration(
          hint: 'Nombre de usuario',
          icon: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _pwdEntry() {
    return Container(
      child: TextField(
        controller: _pwdCtrl,
        onEditingComplete: () => _login(context),
        obscureText: _hidePassword,
        obscuringCharacter: '*',
        keyboardType: TextInputType.text,
        decoration: _intpuDecoration(
          hint: 'Contraseña',
          icon: Icon(Icons.keyboard),
          suffixIcon: InkWell(
            onTap: () =>
                setState(() => this._hidePassword = !this._hidePassword),
            child:
                Icon(this._hidePassword ? Icons.remove_red_eye : Icons.cancel),
          ),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      // ignore: deprecated_member_use
      child: FlatButton(
        onPressed: () => _login(context),
        color: Colors.blue,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(26.0)),
        child: Text(
          'Ingresar',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget _cancelButton() {
    return Container(
      // ignore: deprecated_member_use
      child: OutlineButton(
        onPressed: () {Navigator.of(context).pop();},
        color: Colors.blue,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(26.0)),
        child: Text(
          'Cancelar',
          style: TextStyle(
              color: Colors.grey[500],
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }


  InputDecoration _intpuDecoration(
      {String hint, Icon icon, Widget suffixIcon}) {
    return InputDecoration(
      enabledBorder: new OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[350], width: 1),
        borderRadius: const BorderRadius.all(
          const Radius.circular(20.0),
        ),
      ),
      focusedBorder: new OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 1),
        borderRadius: const BorderRadius.all(
          const Radius.circular(20.0),
        ),
      ),
      errorBorder: new OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
        borderRadius: const BorderRadius.all(
          const Radius.circular(20.0),
        ),
      ),
      hintText: hint,
      filled: true,
      hintStyle: new TextStyle(color: Colors.white38),
      fillColor: Colors.white10,
      prefixIcon: icon,
      suffixIcon: suffixIcon,
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      // labelText: hint,
    );
  }

  Future<void> _login(BuildContext ctx) async {
    MainBloc bloc = MainProvider.of(ctx);
    User user =
        await bloc.signInWithLocal(this._usernameCtrl.text, this._pwdCtrl.text);
    if (user == null) {
      setState(() {
        _error = 'Usuario o clave incorrecta';
      });
    } else {
      _goToHome(ctx);
    }
  }
  void _goToHome(BuildContext ctx) {
    Navigator.of(context).pop();
  }
}