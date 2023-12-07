import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posttest5_096_filipus_manik/provider/theme_mode_data.dart';
import 'package:provider/provider.dart';

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({super.key});

  @override
  State<MySettingsPage> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Color(0xFF374259)
          : Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Color(0xFF374259)
            : Colors.white,
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.yellow
                : Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    Provider.of<ThemeModeData>(context, listen: false)
                        .changeTheme(
                            Provider.of<ThemeModeData>(context, listen: false)
                                    .isDarkModeActive
                                ? ThemeMode.light
                                : ThemeMode.dark);
                  },
                  icons: Theme.of(context).brightness == Brightness.dark
                      ? Icons.dark_mode_rounded
                      : Icons.light_mode_rounded,
                  iconStyle: IconStyle(
                    iconsColor: Colors.yellow,
                    withBackground: true,
                    backgroundColor: const Color(0xFF374259),
                  ),
                  title: 'Dark mode',
                  subtitle: Theme.of(context).brightness == Brightness.light
                      ? "Disabled"
                      : "Enabled",
                  trailing: Switch.adaptive(
                    value: Provider.of<ThemeModeData>(context, listen: false)
                        .isDarkModeActive,
                    onChanged: (bool value) {
                      Provider.of<ThemeModeData>(context, listen: false)
                          .changeTheme(
                              value ? ThemeMode.dark : ThemeMode.light);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
