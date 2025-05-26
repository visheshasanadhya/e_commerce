import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://avatars.githubusercontent.com/u/12619420?s=460&u=26db98cbde1dd34c7c67b85c240505a436b2c36d&v=4";

    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Vishesha Sanadhya"),
                accountEmail: Text("sanadhya2003@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
                decoration: BoxDecoration(color: Colors.deepPurple),
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home, color: Colors.white),
              title: const Text("Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.white),
              title: const Text("Cart",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, MyRoutes.cartRoute);
              },
            ),
            ListTile(
              leading:
              const Icon(CupertinoIcons.profile_circled, color: Colors.white),
              title: const Text("Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.mail, color: Colors.white),
              title: const Text("Email me",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(color: Colors.white70),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text("Logout",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context); // Close drawer first
                // Example: Navigate to login page
                Navigator.pushReplacementNamed(context, MyRoutes.loginRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
