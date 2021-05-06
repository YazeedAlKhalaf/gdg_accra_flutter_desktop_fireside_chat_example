import 'package:flutter/material.dart';
import 'package:flutter_desktop_fireside_chat_example/ui/widgets/responsive.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _HomeViewMobile(),
      desktop: _HomeViewDesktop(),
    );
  }
}

class _HomeViewDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        onTap: onTap,
      );
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          _buildDrawerListTile(
            title: "Home",
            icon: Icons.home_rounded,
            onTap: () {},
          ),
          _buildDrawerListTile(
            title: "Orders",
            icon: Icons.receipt_long_rounded,
            onTap: () {},
          ),
          _buildDrawerListTile(
            title: "Customers",
            icon: Icons.person_rounded,
            onTap: () {},
          ),
          _buildDrawerListTile(
            title: "Products",
            icon: Icons.local_offer_rounded,
            onTap: () {},
          ),
          _buildDrawerListTile(
            title: "Analytics",
            icon: Icons.analytics_rounded,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _HomeViewMobile extends StatefulWidget {
  @override
  __HomeViewMobileState createState() => __HomeViewMobileState();
}

class __HomeViewMobileState extends State<_HomeViewMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: _HomeViewDrawer(),
    );
  }
}

class _HomeViewDesktop extends StatefulWidget {
  @override
  __HomeViewDesktopState createState() => __HomeViewDesktopState();
}

class __HomeViewDesktopState extends State<_HomeViewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          _HomeViewDrawer(),
        ],
      ),
    );
  }
}
