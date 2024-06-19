import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 50),
          ExpansionTile(title: const Text('PRODUCTS'), onExpansionChanged: (value) {
          }, children: const [
            ListTile(title: Text('PRODUCT 1')),
            ListTile(title: Text('PRODUCT 2')),
            ListTile(title: Text('PRODUCT 3')),
          ],
          ),
          ExpansionTile(title: const Text('3D MODELS'), onExpansionChanged: (value) {
          }, children: const [
            ListTile(title: Text('3D MODEL 1')),
            ListTile(title: Text('3D MODEL 2')),
            ListTile(title: Text('3D MODEL 3')),
          ],
          ),
          ListTile(title: const Text('GALLERY'), onTap: () {},),
          ListTile(title: const Text('ABOUT'), onTap: () {}),
          ListTile(title: const Text('CONTACT'), onTap: () {},),
        ],
      ),
    );
  }
}