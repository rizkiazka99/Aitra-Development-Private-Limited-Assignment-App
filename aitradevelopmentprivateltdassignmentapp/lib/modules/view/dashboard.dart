import 'package:aitradevelopmentprivateltdassignmentapp/modules/controller/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.find<DashboardController>();

    return Scaffold();
  }
}