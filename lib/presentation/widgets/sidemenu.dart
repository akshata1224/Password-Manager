import 'package:flutter/material.dart';
import 'package:pm/presentation/widgets/confirmation_dailog.dart';
import 'package:pm/presentation/widgets/sidemenu_tiles.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            // Header
            ListTile(
              leading:
                  Image.asset("assets/images/logo.png", height: 36, width: 36),
              title: const Text("Password Manager",
                  style: TextStyle(fontSize: 20)),
            ),
            const Divider(color: Colors.black54, thickness: 0.8),

            // Body

            //All
            SMListTile(
              icon: Icons.all_inbox,
              text: "All",
              onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
            ),

            // Trash
            SMListTile(
              icon: Icons.delete_outline,
              text: "Trash",
              onTap: () => Navigator.of(context).pushReplacementNamed('/trash'),
            ),
           // const Divider(color: Colors.black54, thickness: 0.8),

            // About Us
            SMListTile(
              icon: Icons.person,
              text: "About Us",
              onTap: () {
                {
                  Navigator.pop(context);
                  showAboutDialog(
                    context: context,
                    applicationName: 'Password Manager',
                    // TODO: Before Publishing: Change the app version below
                    // Change in pubspec.yaml file too
                    applicationVersion: '1.0.0',
                    applicationIcon: Image.asset(
                      'assets/images/logo.png',
                      height: 50,
                      width: 50,
                    ),
                    applicationLegalese:
                        'This app is designed and created by Bhavani and Team.',
                  );
                }
              },
            ),
           // const Divider(color: Colors.black54, thickness: 0.8),

            // Share
            SMListTile(
              icon: Icons.share_outlined,
              text: "Share",
              onTap: () async {
                Navigator.pop(context);
                await Share.share(
                    'https://play.google.com/store/apps/details?id=com.subarnainfotech.password_manager');
              },
            ),

            // Rate Us
            // SMListTile(
            //   icon: Icons.star_outlined,
            //   text: "Rate Us",
            //   onTap: () async {
            //     Navigator.pop(context);
            //     await RateMyApp().launchStore();
            //   },
            // ),

            // Exit
            SMListTile(
              icon: Icons.exit_to_app,
              text: "Exit",
              onTap: () async {
                Navigator.pop(context);
                exitAppConfirmation(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
