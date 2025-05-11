import 'package:flutter/material.dart';
import 'package:syncserve/customer_detail.dart';
import 'package:syncserve/styles.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.appBarAndNavBarColor,
        actions: [
          Row(
            children: [
              Text(
                'Log out',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {},
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'assets/images/worker.png',
                width: 200,
                height: 150,
              ),
              Text(
                'Hello! Technician.',
                style: AppStyle.headingText,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 20),
                child: ElevatedButton(
                  style: AppStyle.elevatedButtonStyle(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomerDetail(),
                      ),
                    );
                  },
                  child: Text(
                    'Start UPS Service',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: ElevatedButton(
                  style: AppStyle.elevatedButtonStyle(),
                  onPressed: () {},
                  child: Text(
                    'Start Generator Service',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppStyle.appBarAndNavBarColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
