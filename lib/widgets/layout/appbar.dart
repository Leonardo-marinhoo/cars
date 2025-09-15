
import 'package:flutter/material.dart';

PreferredSizeWidget appBarWidget(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  );
  
}