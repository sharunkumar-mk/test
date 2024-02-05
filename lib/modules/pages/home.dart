import 'package:flutter/material.dart';
import 'package:test_app/constants/routes_path.dart';
import 'package:test_app/modules/widgets/common_dropdown.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, List<String>> stateOptions = {
    'IN': ['KA', 'KL', 'TN', 'MH'],
    'US': ['AL', 'DE', 'GA'],
    'CA': ['ON', 'QC', 'BC'],
  };

  String selectedCountry = 'IN';
  String selectedState = 'KA';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const Text("Task - 1"),
          CommonDropdown(
              label: 'More actions',
              items: const ['View', 'Edit', 'Send', 'Delete'],
              selectedValue: "View",
              onChanged: (value) {}),
          const SizedBox(height: 40),
          const Text("Task - 2"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonDropdown(
                label: 'Countries',
                items: const ['IN', 'US', 'CA'],
                selectedValue: selectedCountry,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value!;
                    selectedState = stateOptions[value]![0];
                  });
                },
              ),
              const SizedBox(height: 40),
              CommonDropdown(
                label: 'States',
                items: stateOptions[selectedCountry]!,
                selectedValue: selectedState,
                onChanged: (value) {
                  setState(() {
                    selectedState = value!;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text("Task - 3"),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, usersScreen);
              },
              child: const Text('Load Users'))
        ],
      ),
    ));
  }
}
