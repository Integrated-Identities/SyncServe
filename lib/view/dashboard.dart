import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncserve/view/customer_detail.dart';
import 'package:syncserve/theme/styles.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppStyle.appBarNavBarCardAndCanvasColor,
        actions: [
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.logOut,
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
                AppLocalizations.of(context)!.hello,
                style: AppStyle.headingText,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 10),
                child: ElevatedButton(
                  style: AppStyle.primaryElevatedButtonStyle(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomerDetail(),
                      ),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.startUPSservice,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: ElevatedButton(
                  style: AppStyle.primaryElevatedButtonStyle(),
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context)!.startGeneratorService,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppStyle.appBarNavBarCardAndCanvasColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppLocalizations.of(context)!.settings,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: AppLocalizations.of(context)!.profile,
          ),
        ],
      ),
    );
  }
}
