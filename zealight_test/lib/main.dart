import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zealight_test/provider.dart';
import 'package:zealight_test/school_list.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SchoolsProvider(),
      child: const MaterialApp(
        home: SchoolListScreen(),
      ),
    ),
  );
}
