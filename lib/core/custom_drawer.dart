import 'package:davodeneme/pages/route_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Text('Exp Wallpaper'),
          ),
          TextButton(
            child: const Text('AnaSayfa'),
            onPressed: () {
              context.read<RouteBloc>().home();
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('Favorite'),
            onPressed: () {
              context.read<RouteBloc>().favorite();
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
