import 'package:flutter/material.dart';
import 'package:flutter_desktop_fireside_chat_example/app/providers/home_provider.dart';

import 'package:flutter_desktop_fireside_chat_example/ui/widgets/responsive.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
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

    _buildDrawerListTile({
      required String title,
      required IconData icon,
      required void Function() onTap,
    }) {
      return ListTile(
        leading: Icon(
          icon,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {
          onTap();
          if (!Responsive.isDesktop(context)) {
            Navigator.of(context).pop();
          }
        },
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          _buildDrawerListTile(
            title: "Home",
            icon: Icons.home_rounded,
            onTap: () {
              _drawerIndexProvider.setIndex(0);
            },
          ),
          _buildDrawerListTile(
            title: "Orders",
            icon: Icons.receipt_long_rounded,
            onTap: () {
              _drawerIndexProvider.setIndex(1);
            },
          ),
          _buildDrawerListTile(
            title: "Customers",
            icon: Icons.person_rounded,
            onTap: () {
              _drawerIndexProvider.setIndex(2);
            },
          ),
          _buildDrawerListTile(
            title: "Products",
            icon: Icons.local_offer_rounded,
            onTap: () {
              _drawerIndexProvider.setIndex(3);
            },
          ),
          _buildDrawerListTile(
            title: "Analytics",
            icon: Icons.analytics_rounded,
            onTap: () {
              _drawerIndexProvider.setIndex(4);
            },
          ),
        ],
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
        Center(child: Text("Home View")),
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
      appBar: AppBar(),
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
          Expanded(
            child: _MainViewIndexedStack(),
          ),
        ],
      ),
    );
  }
}
