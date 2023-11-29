import 'package:ai/view/record_screen.dart';
import 'package:ai/viewModel/controllers/navigation_bar_controller.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BNavController bNavController = Get.put(BNavController());
    List<Widget> screens = [
      RecordPage(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xffCCE5EC),
      appBar: AppBar(
        backgroundColor: const Color(0xffD3D3D3),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.light),
          ),
        ],
      ),
      body: screens[0],
      bottomNavigationBar: Obx(
        () => FluidNavBar(
          defaultIndex: bNavController.currentIndex.value,
          icons: [
            FluidNavBarIcon(icon: Icons.home),
            FluidNavBarIcon(icon: Icons.bookmark),
            FluidNavBarIcon(icon: Icons.add),
            FluidNavBarIcon(icon: Icons.book),
            FluidNavBarIcon(icon: Icons.supervised_user_circle),
          ],
          style: const FluidNavBarStyle(
            iconUnselectedForegroundColor: Colors.blueGrey,
            iconSelectedForegroundColor: Color.fromARGB(255, 19, 64, 124),
          ),
          onChange: (index) {
            bNavController.onChange(index);
          },
        ),
      ),
    );
  }
}
