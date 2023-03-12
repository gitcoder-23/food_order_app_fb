import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff2b2b2b),
      child: Container(
        color: const Color(0xff2b2b2b),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/background.jpg'),
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                accountName: Text('Ram Kumar'),
                accountEmail: Text('ram@yahoo.com'),
                // accountEmail: InkWell(
                //   onTap: () => Scaffold.of(context).closeDrawer(),
                //   child: const Text('ram@yahoo.com'),
                // ),
              ),
              drawerListMenu(
                menuName: 'Profile',
                menuIcon: Icons.person,
              ),
              drawerListMenu(
                menuName: 'Cart',
                menuIcon: Icons.add_shopping_cart,
              ),
              drawerListMenu(
                menuName: 'Order',
                menuIcon: Icons.shop,
              ),
              drawerListMenu(
                menuName: 'About',
                menuIcon: Icons.info,
              ),
              const Divider(
                thickness: 2,
                color: Colors.white,
              ),
              const ListTile(
                leading: Text(
                  'Communicate',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              drawerListMenu(
                menuName: 'Change',
                menuIcon: Icons.lock,
              ),
              drawerListMenu(
                menuName: 'Log Out',
                menuIcon: Icons.exit_to_app,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerListMenu({
    required String menuName,
    required IconData menuIcon,
  }) {
    return ListTile(
      leading: Icon(
        menuIcon,
        color: Colors.white,
      ),
      title: Text(
        menuName,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      // trailing: Text('Profile'),
    );
  }
}
