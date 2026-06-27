import 'package:flutter/material.dart';
import '../constants.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: secondaryColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.business, size: 48, color: primaryColor),
                const SizedBox(height: 10),
                Text("AdStacks Office", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
          ),
          DrawerListTile(
            title: "Dashboard",
            icon: Icons.dashboard,
            press: () {},
            selected: true,
          ),
          DrawerListTile(
            title: "Employees",
            icon: Icons.people,
            press: () {},
          ),
          DrawerListTile(
            title: "Projects",
            icon: Icons.work,
            press: () {},
          ),
          DrawerListTile(
            title: "Reports",
            icon: Icons.pie_chart,
            press: () {},
          ),
          DrawerListTile(
            title: "Settings",
            icon: Icons.settings,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
    this.selected = false,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: selected ? primaryColor : Colors.white54,
        size: 20,
      ),
      title: Text(
        title,
        style: TextStyle(color: selected ? primaryColor : Colors.white54),
      ),
    );
  }
}
