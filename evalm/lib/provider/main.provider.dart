import 'package:evalm/bloc/main.bloc.dart';
import 'package:flutter/material.dart';

class MainProvider extends InheritedWidget {
  final bloc = MainBloc();

  MainProvider({Key key, Widget child}) : super(key: key, child: child);

  static MainBloc of(BuildContext ctx) {
    return ctx.dependOnInheritedWidgetOfExactType<MainProvider>().bloc;
  }

  @override
  bool updateShouldNotify(_) => true;
}