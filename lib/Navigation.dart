import 'package:dangletime/main.dart';
import 'package:dangletime/tabs/Home.dart';
import 'package:dangletime/tabs/Friends.dart';
import 'package:dangletime/tabs/Profile.dart';
import 'package:dangletime/tabs/profile/settings/Settings.dart';
import 'package:dangletime/widgets/BasicTitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dangletime/theme/SettingsStateNotifier.dart';
import 'package:dangletime/NavigationTab.dart';
import 'models/Settings.dart';

// This is the stateful widget that the main application instantiates.
class Navigation extends StatefulWidget {
  Navigation({Key key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _NavigationState extends State<Navigation> {
  // State variables
  Widget _title;
  List<Widget> _actions;
  int _selectedIndex = 0;
  static List<NavigationTab> _tabs = [
    NavigationTab(
      title: BasicTitle(title: "Dangle Time"),
      actions: [],
      body: Home(),
    ),
    NavigationTab(
      title: BasicTitle(title: "Friends"),
      actions: [],
      body: Friends(),
    ),
    NavigationTab(
      title: BasicTitle(title: "Profile"),
      actions: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: IconButton(
            icon: Icon(
              Icons.settings,
              size: 28,
            ),
            onPressed: () {
              navigatorKey.currentState.push(MaterialPageRoute(builder: (BuildContext context) {
                return ProfileSettings();
              }));
            },
          ),
        ),
      ],
      body: Profile(),
    ),
  ];

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
      _title = _tabs[index].title;
      _actions = _tabs[index].actions;
    });
  }

  @override
  void initState() {
    _loadPreferences();

    setState(() {
      _title = BasicTitle(title: "Dangle Time");
      _actions = [];
    });

    super.initState();
  }

  // Load shared preferences
  void _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool darkMode = prefs.getBool('dark_mode') ?? ThemeMode.system == ThemeMode.dark;

    Provider.of<SettingsStateNotifier>(context, listen: false).updateSettings(Settings(darkMode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              collapsedHeight: 65,
              expandedHeight: 140,
              backgroundColor: Theme.of(context).colorScheme.primary,
              iconTheme: Theme.of(context).iconTheme,
              actionsIconTheme: Theme.of(context).iconTheme,
              floating: true,
              pinned: true,
              flexibleSpace: DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                ),
                child: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  centerTitle: false,
                  title: _title,
                  background: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
              actions: _actions,
            ),
          ];
        },
        body: Container(
          padding: EdgeInsets.only(bottom: 0),
          child: _tabs.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Theme.of(context).backgroundColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
        onTap: _onItemTapped,
      ),
    );
  }
}
