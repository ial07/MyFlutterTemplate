import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/routes/app_pages.dart';
import 'package:flutter_application_1/app/shared/widgets/InputForm.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DashboardView'), centerTitle: true),
      body: Column(children: [Text("ABC")]),
      bottomNavigationBar: ConvexAppBar.badge(
        {3: '99+'},
        badgeMargin: EdgeInsets.only(bottom: 30, left: 30),
        style: TabStyle.fixedCircle,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (int i) {
          if (i == 1) {
            Get.toNamed(Routes.REGISTER); // Navigate to the Register page
          } else if (i == 4) {
            Get.toNamed(Routes.DASHBOARD);
          } else {
            print('Click index=$i');
          }
        },
      ),
    );
  }
}
