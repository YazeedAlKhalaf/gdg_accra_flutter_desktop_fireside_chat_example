import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_desktop_fireside_chat_example/app/providers/main_providers.dart';
import 'package:flutter_desktop_fireside_chat_example/ui/views/home_view.dart';
import 'package:flutter_desktop_fireside_chat_example/ui/widgets/responsive.dart';

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _MainViewMobile(),
      desktop: _MainViewDesktop(),
    );
  }
}

class _MainViewDrawer extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final DrawerIndexProvider _drawerIndexProvider =
        watch(drawerIndexProvider.notifier);

    Widget _buildDrawerListTile({
      required String title,
      required IconData icon,
      required bool isChecked,
      String? trailingText,
      required void Function() onTap,
    }) {
      return ListTile(
        leading: Icon(
          icon,
          color: isChecked ? Color(0xff396AFF) : null,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: isChecked ? Color(0xff396AFF) : null,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: () {
          onTap();
          if (!Responsive.isDesktop(context)) {
            Navigator.of(context).pop();
          }
        },
        hoverColor: Color(0xffEEF5FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        trailing: trailingText != null
            ? SizedBox(
                width: 35,
                height: 35,
                child: Card(
                  elevation: 0,
                  color: Color(0xffFF82AC),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      trailingText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              )
            : null,
      );
    }

    Widget _buildProfileCard() {
      return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Color(0xffEFF5FA),
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 10),
              Card(
                color: Color(0xff30357C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.radio_button_checked_rounded,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Yazeed AlKhalaf",
                      style: TextStyle(
                        color: Color(0xff30357C),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Card(
                      color: Color(0xff16DBCC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 3,
                        ),
                        child: Text(
                          "Trial, 12 days left",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down_rounded,
                    ),
                    onPressed: () {},
                    splashRadius: 15,
                  ),
                ],
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      );
    }

    return Drawer(
      elevation: Responsive.isDesktop(context) ? 0 : 16,
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              _buildProfileCard(),
              const SizedBox(height: 35),
              _buildDrawerListTile(
                title: "Home",
                icon: Icons.home_rounded,
                isChecked: watch(drawerIndexProvider) == 0,
                onTap: () {
                  _drawerIndexProvider.setIndex(0);
                },
              ),
              _buildDrawerListTile(
                title: "Orders",
                icon: Icons.receipt_long_rounded,
                isChecked: watch(drawerIndexProvider) == 1,
                trailingText: "6",
                onTap: () {
                  _drawerIndexProvider.setIndex(1);
                },
              ),
              _buildDrawerListTile(
                title: "Customers",
                icon: Icons.person_rounded,
                isChecked: watch(drawerIndexProvider) == 2,
                onTap: () {
                  _drawerIndexProvider.setIndex(2);
                },
              ),
              _buildDrawerListTile(
                title: "Products",
                icon: Icons.local_offer_rounded,
                isChecked: watch(drawerIndexProvider) == 3,
                onTap: () {
                  _drawerIndexProvider.setIndex(3);
                },
              ),
              _buildDrawerListTile(
                title: "Analytics",
                icon: Icons.analytics_rounded,
                isChecked: watch(drawerIndexProvider) == 4,
                onTap: () {
                  _drawerIndexProvider.setIndex(4);
                },
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MainViewIndexedStack extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return IndexedStack(
      index: watch(drawerIndexProvider),
      children: <Widget>[
        HomeView(),
        Center(child: Text("Orders View")),
        Center(child: Text("Customers View")),
        Center(child: Text("Products View")),
        Center(child: Text("Analytics View")),
      ],
    );
  }
}

class _MainViewMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Desktop Fireside Chat Example",
        ),
      ),
      drawer: _MainViewDrawer(),
      body: _MainViewIndexedStack(),
    );
  }
}

class _MainViewDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          _MainViewDrawer(),
          VerticalDivider(),
          Expanded(
            child: _MainViewIndexedStack(),
          ),
        ],
      ),
    );
  }
}
