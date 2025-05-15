import 'package:ecommerce_app/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/app_bar_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: "Search for products",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide.none
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
            ),)
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.logoNavSvg),
      actions: [
        AppBarActionButton(icon: Icons.person_outline, onTap: () {}),
        SizedBox(width: 8),
        AppBarActionButton(icon: Icons.call, onTap: () {}),
        SizedBox(width: 8),
        AppBarActionButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        SizedBox(width: 10),
      ],
    );
  }
}