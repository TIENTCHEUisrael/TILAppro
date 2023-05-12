import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:tilappro/screen/components/dashboard/pages/Me/account.dart';
import 'package:tilappro/screen/components/dashboard/pages/company/collectePage.dart';
import 'package:tilappro/screen/components/dashboard/pages/company/userPage.dart';
import 'package:tilappro/screen/components/dashboard/pages/home.dart';
import 'package:tilappro/screen/components/dashboard/pages/notfound.dart';

import '../../../config/responsive.dart';
import '../../../models/user/user_model.dart';
import '../../widgets/drawermenu.dart';

class DashboardContent extends StatefulWidget {
  final User user;
  const DashboardContent({required this.user});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    //var auth = Provider.of<AuthProvider>(context, listen: false);
    return Builder(builder: (context) {
      return SafeArea(
        child: Scaffold(
          key: _key,
          appBar: Responsive.isMobile(context)
              ? AppBar(
                  leading: IconButton(
                    onPressed: () {
                      _key.currentState?.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                    ),
                  ),
                )
              : null,
          drawer: SideBarWidget(controller: _controller),
          body: Row(
            children: [
              if (Responsive.isDesktop(context) || Responsive.isTablet(context))
                SideBarWidget(controller: _controller),
              Expanded(
                child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      switch (_controller.selectedIndex) {
                        case 0:
                          _key.currentState!.closeDrawer();
                          return HomePage(user: widget.user);
                        case 1:
                          _key.currentState!.closeDrawer();
                          return AccountPage(user: widget.user);
                        case 2:
                          _key.currentState!.closeDrawer();
                          return EmployePage(user: widget.user);
                        case 3:
                          _key.currentState!.closeDrawer();
                          return CollectionPage(user: widget.user);

                        default:
                          _key.currentState!.closeDrawer();
                          return NotFoundPage(user: widget.user);
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
