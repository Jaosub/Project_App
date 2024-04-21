import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shoe.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/profile.dart';

class NavigationDestination {
  final Widget icon;
  final String label;
  final Widget Function(BuildContext) pageBuilder;

  NavigationDestination({
    required this.icon,
    required this.label,
    required this.pageBuilder,
  });
}

List<NavigationDestination> _navBarItems = [
  NavigationDestination(
    icon: const Icon(Icons.home_outlined),
    label: 'หน้าแรก',
    pageBuilder: (context) => HomePage(),
  ),
  NavigationDestination(
    icon: const Icon(Icons.dashboard_customize_outlined),
    label: 'หมวดหมู่',
    pageBuilder: (context) => ShoePage(),
  ),
  NavigationDestination(
    icon: const Icon(Icons.person_outline_rounded),
    label: 'โปรไฟล์',
    pageBuilder: (context) => ProfilePage(),
  ),
];

List<NavigationDestination> get navBarItems => _navBarItems;
