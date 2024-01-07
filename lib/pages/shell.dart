import 'package:davodeneme/core/custom_drawer.dart';
import 'package:davodeneme/pages/favorite_page/favorite_page.dart';
import 'package:davodeneme/pages/home_page/home_page.dart';
import 'package:davodeneme/pages/route_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Shell extends StatelessWidget {
  const Shell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const CustomDrawer(),
        body: BlocBuilder<RouteBloc, PageEnum>(
          builder: (context, state) {
            switch (state) {
              case PageEnum.home:
                return HomePage();
              case PageEnum.favorite:
                return const FavoritePage();
            }
          },
        ));
  }
}
