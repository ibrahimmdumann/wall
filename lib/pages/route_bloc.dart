import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteBloc extends Cubit<PageEnum> {
  RouteBloc() : super(PageEnum.home);

  void home() => emit(PageEnum.home);
  void favorite() => emit(PageEnum.favorite);
}

enum PageEnum { home, favorite }
