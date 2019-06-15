import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'folder_open': Icons.folder_open,
  'accessibility': Icons.accessibility,
  'donut_large': Icons.donut_large,
  'list': Icons.list,
  'tune': Icons.tune,
  'input': Icons.input
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.blue,);
}