import 'package:aitradevelopmentprivateltdassignmentapp/modules/view/krishi_bazaar_screen.dart';
import 'package:aitradevelopmentprivateltdassignmentapp/modules/view/other_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final PageStorageBucket bucket = PageStorageBucket();

  RxInt _selectedIndex = 2.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int selectedIndex) =>
      this._selectedIndex.value = selectedIndex;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String appbarTitle(int index) {
    String title = '';

    switch(index) {
      case 0:
        title = 'Home';
        break;
      case 1:
        title = 'My Station';
        break;
      case 2:
        title = 'Krishi Bazaar';
        break;
      case 3:
        title = 'My Farm';
        break;
      case 4:
        title = 'Krishi Gyan';
        break;
      default:
        title = '';
        break;
    }

    return title;
  }

  final List<Widget> pages = [
    const HomeScreen(
      key: PageStorageKey('Page1'),
    ),
    const MyStationScreen(
      key: PageStorageKey('Page2'),
    ),
    const KrishiBazaarScreen(
      key: PageStorageKey('Page3'),
    ),
    const MyFarmScreen(
      key: PageStorageKey('Page4'),
    ),
    const KrishiGyanScreen(
      key: PageStorageKey('Page5'),
    )
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
  }
}