import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dangletime/Login.dart';
import 'package:dangletime/main.dart';
import 'package:dangletime/models/Settings.dart';
import 'package:dangletime/services/authentication/auth.dart';
import 'package:dangletime/theme/SettingsStateNotifier.dart';
import 'package:dangletime/widgets/BasicTitle.dart';

import 'EditProfile.dart';

class ProfileSettings extends StatefulWidget {
  ProfileSettings({Key key}) : super(key: key);

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  // State settings values
  bool _darkMode = false;

  @override
  void initState() {
    super.initState();

    _loadSettings();
  }

  //Loading counter value on start
  _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _darkMode = (prefs.getBool('dark_mode') ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              collapsedHeight: 65,
              expandedHeight: 65,
              backgroundColor: Theme.of(context).colorScheme.primary,
              floating: true,
              pinned: true,
              leading: Container(
                margin: EdgeInsets.only(top: 10),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 28,
                  ),
                  onPressed: () {
                    navigatorKey.currentState.pop();
                  },
                ),
              ),
              flexibleSpace: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                ),
                child: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  titlePadding: null,
                  centerTitle: false,
                  title: BasicTitle(title: "Settings"),
                  background: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
              actions: [],
            ),
          ];
        },
        body: SettingsList(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          sections: [
            SettingsSection(
              title: 'General',
              titleTextStyle: Theme.of(context).textTheme.headline6,
              tiles: [
                SettingsTile.switchTile(
                  titleTextStyle: Theme.of(context).textTheme.bodyText1,
                  title: 'Dark Mode',
                  leading: Icon(
                    Icons.brightness_2,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  switchValue: _darkMode,
                  onToggle: (bool value) async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    setState(() {
                      _darkMode = !_darkMode;
                      prefs.setBool('dark_mode', _darkMode);
                    });

                    Provider.of<SettingsStateNotifier>(context, listen: false).updateSettings(Settings(value));
                  },
                ),
              ],
            ),
            SettingsSection(
              titleTextStyle: Theme.of(context).textTheme.headline6,
              title: 'Account',
              tiles: [
                SettingsTile(
                  title: 'Edit Profile',
                  titleTextStyle: Theme.of(context).textTheme.bodyText1,
                  subtitleTextStyle: Theme.of(context).textTheme.bodyText2,
                  leading: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: (BuildContext context) {
                    navigatorKey.currentState.push(
                      MaterialPageRoute(
                        builder: (context) {
                          return EditProfile();
                        },
                      ),
                    );
                  },
                ),
                SettingsTile(
                  title: 'Logout',
                  titleTextStyle: TextStyle(
                    color: Colors.red,
                    fontSize: Theme.of(context).textTheme.bodyText1.fontSize,
                  ),
                  subtitleTextStyle: Theme.of(context).textTheme.bodyText2,
                  leading: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  onPressed: (BuildContext context) {
                    signOut();

                    navigatorKey.currentState.pop();
                    navigatorKey.currentState.pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return Login();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
