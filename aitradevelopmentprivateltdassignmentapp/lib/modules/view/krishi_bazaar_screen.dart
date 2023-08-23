import 'package:aitradevelopmentprivateltdassignmentapp/modules/controller/controllers/krishi_bazaar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KrishiBazaarScreen extends StatefulWidget {
  const KrishiBazaarScreen({super.key});

  @override
  State<KrishiBazaarScreen> createState() => _KrishiBazaarScreenState();
}

class _KrishiBazaarScreenState extends State<KrishiBazaarScreen> {
  @override
  Widget build(BuildContext context) {
    KrishiBazaarController controller = Get.find<KrishiBazaarController>();

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: const Center(
              child: Text('Krishi Bazaar'),
            ),
          ),
        ),
      ),
    );
  }
}