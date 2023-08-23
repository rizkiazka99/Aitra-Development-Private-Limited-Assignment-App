import 'package:aitradevelopmentprivateltdassignmentapp/core/colors.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/core/font_sizes.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/controller/controllers/dashboard_controller.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/view/krishi_bazaar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PreferredSizeWidget appBar(DashboardController controller) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          color: secondaryColor,
        ),
      ),
      title: Obx(() => Text(
        controller.appbarTitle(controller.selectedIndex),
        style: h4_5(color: primaryColor),
      )),
      centerTitle: true,
    );
  }

  Widget body(DashboardController controller) {
    return Obx(() => PageStorage(
      bucket: controller.bucket,
      child: controller.pages[controller.selectedIndex],
    ));
  }

  Widget bottomNavBar(DashboardController controller) {
    return Obx(() => BottomNavigationBar(
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          activeIcon: Image.asset('assets/icons/home_selected.png'),
          icon: Image.asset('assets/icons/home_unselected.png'),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          activeIcon: Image.asset('assets/icons/mystation_selected.png'),
          icon: Image.asset('assets/icons/mystation_unselected.png'),
          label: 'My Station'
        ),
        BottomNavigationBarItem(
          activeIcon: Image.asset('assets/icons/krishibazaar_selected.png'),
          icon: Image.asset('assets/icons/krishibazaar_unselected.png'),
          label: 'Krishi Bazaar'
        ),
        BottomNavigationBarItem(
          activeIcon: Image.asset('assets/icons/myfarm_selected.png'),
          icon: Image.asset('assets/icons/myfarm_unselected.png'),
          label: 'My Farm'
        ),
        BottomNavigationBarItem(
          activeIcon: Image.asset('assets/icons/krishigyan_selected.png'),
          icon: Image.asset('assets/icons/krishigyan_unselected.png'),
          label: 'Krishi Gyan'
        )
      ],
      currentIndex: controller.selectedIndex,
      onTap: controller.onItemTapped,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: contextGrey,
      selectedItemColor: contextGrey,
    ));
  }

  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.find<DashboardController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(controller),
      body: body(controller),
      bottomNavigationBar: bottomNavBar(controller),
    );
  }
}