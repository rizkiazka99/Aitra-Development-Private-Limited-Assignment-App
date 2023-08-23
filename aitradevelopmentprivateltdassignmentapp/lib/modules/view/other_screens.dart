import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: const Center(
              child: Text('Home'),
            ),
          ),
        ),
      ),
    );
  }
}

class MyStationScreen extends StatefulWidget {
  const MyStationScreen({super.key});

  @override
  State<MyStationScreen> createState() => _MyStationScreenState();
}

class _MyStationScreenState extends State<MyStationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: const Center(
              child: Text('My Station'),
            ),
          ),
        ),
      ),
    );
  }
}

class MyFarmScreen extends StatefulWidget {
  const MyFarmScreen({super.key});

  @override
  State<MyFarmScreen> createState() => _MyFarmScreenState();
}

class _MyFarmScreenState extends State<MyFarmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: const Center(
              child: Text('My Farm'),
            ),
          ),
        ),
      ),
    );
  }
}

class KrishiGyanScreen extends StatefulWidget {
  const KrishiGyanScreen({super.key});

  @override
  State<KrishiGyanScreen> createState() => _KrishiGyanScreenState();
}

class _KrishiGyanScreenState extends State<KrishiGyanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: const Center(
              child: Text('Krishi Gyan'),
            ),
          ),
        ),
      ),
    );
  }
}