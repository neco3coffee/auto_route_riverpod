import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:go_route_riverpod/ui/route/app_router.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // list of your tab routes
      // routes used here must be declaraed as children
      // routes of /dashboard
      routes: const [
        UsersRoute(),
        PostsRoute(),
        SettingsRoute(),
      ],
      builder: (context, child, animation) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        //alterntivly you could use a global key
        return Scaffold(
            body: FadeTransition(
              opacity: animation,
              // the passed child is techinaclly our animated selected-tab page
              child: child,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                // here we switch between tabs
                tabsRouter.setActiveIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    label: 'Users', icon: Icon(Icons.person)),
                BottomNavigationBarItem(label: 'Posts', icon: Icon(Icons.add)),
                BottomNavigationBarItem(
                    label: 'Settings', icon: Icon(Icons.settings)),
              ],
            ));
      },
    );
  }
}
