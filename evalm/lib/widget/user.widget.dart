import 'package:evalm/bloc/main.bloc.dart';
import 'package:evalm/data/models/user.dart';
import 'package:evalm/provider/main.provider.dart';
import 'package:evalm/screens/login.screen.dart';
import 'package:flutter/material.dart';

class UserIconHeader extends StatelessWidget {
  Color color = Colors.black;
  double size = 12;
  UserIconHeader({this.color, this.size});

  @override
  Widget build(BuildContext context) {
    MainBloc bloc = MainProvider.of(context);

    return StreamBuilder<User>(
      stream: bloc.loggedUser,
      builder: (_, snap) {
        if (snap.hasData && snap.data != null) {
          if (snap.data.email != null && snap.data.email != '') {
            return Image.network(
              'https://cdn.iconscout.com/icon/free/png-512/laptop-user-1-1179329.png',
              height: 28,
            );
          } else {
            return Image.network(
              'https://static.thenounproject.com/png/977897-200.png',
              height: 28,
            );
          }
        } else {
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Icon(
                Icons.login,
                size: this.size,
                color: this.color,
              ),
            ),
          );
        }
      },
    );
  }
}