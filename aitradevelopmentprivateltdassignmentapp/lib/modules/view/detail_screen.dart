import 'package:aitradevelopmentprivateltdassignmentapp/modules/controller/controllers/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    DetailController controller = Get.find<DetailController>();

    return Scaffold();
  }
}