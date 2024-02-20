import 'package:app_speat/components/list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  const MyDrawer({super.key, this.onProfileTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const DrawerHeader(
                child: Icon(Icons.person, size: 64),
              ),
              MyListTile(
                  icon: Icons.home,
                  text: "Accueil",
                  onTap: () => Navigator.pop(context)),
              MyListTile(
                  icon: Icons.person, text: "Profil", onTap: onProfileTap)
            ],
          ),
        ],
      ),
    );
  }
}
