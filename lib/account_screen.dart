
import 'package:flutter/material.dart';
import 'package:matrix/theme/theme.dart';

import 'custom_widgets/rounded_widget.dart';
import 'custom_widgets/tabs.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  final double tab_height = 72;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account",
          style: Theme.of(context).primaryTextTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Company",
                style: Theme.of(context).primaryTextTheme.bodyMedium,
              ),
            ),
            RoundedWidget(
              radius: 10,
              children: [
                SettingsTab(
                  text: "Matrix",
                  icon: Icon(Icons.shopping_bag, color: AppStyle.lightBlue, size: 28, ),
                  title: "My company",
                  arrowHaving: true,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Notifications",
                style: Theme.of(context).primaryTextTheme.bodyMedium,
              ),
            ),
            RoundedWidget(
              radius: 10,
              children: [
                SettingsTab(
                  text: "3 hours",
                  icon: Icon(Icons.notifications, color: AppStyle.lightBlue, size: 28, ),
                  title: "Do not disturb",
                  arrowHaving: true,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Applications Settings",
                style: Theme.of(context).primaryTextTheme.bodyMedium,
              ),
            ),
            RoundedWidget(
              radius: 10,
              children: [
                SettingsTab(
                  title: "Language",
                  text: "English",
                  icon: Icon(Icons.language, color: AppStyle.lightBlue, size: 28,),
                  arrowHaving: true,
                ),
                SettingsTab(
                  arrowHaving: true,
                  text: "Privacy Policy",
                  icon: Icon(Icons.remove_red_eye_outlined, color: AppStyle.lightBlue, size: 28,),
                ),
                SettingsTab(
                  arrowHaving: true,
                  text: "Terms of use",
                  icon: Icon(Icons.settings, color: AppStyle.lightBlue, size: 28,),
                ),
                SettingsTab(
                  text: "1.0.0",
                  icon: Icon(Icons.document_scanner_outlined, color: AppStyle.lightBlue, size: 28, ),
                  title: "Version",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}