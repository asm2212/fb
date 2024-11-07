import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tg/screens/home_screen.dart';
import 'package:tg/widgets/custom_tab_bar.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List <Widget> _screens = [
    const HomeScreen(),
    const Scaffold(),  
  const Scaffold(), 
    const Scaffold(),  
  const Scaffold(), 
       const Scaffold(),  
  const Scaffold(), 
  ];

  final List <IconData> _icons = [
     Icons.home,
     Icons.ondemand_video,
     MdiIcons.accountCircleOutline,
     MdiIcons.accountGroupOutline,
     MdiIcons.bellOutline,
     Icons.menu,
     
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom:12),
          child: CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(() => _selectedIndex = index),
          ),
        ),
      ),
    );
  }
}