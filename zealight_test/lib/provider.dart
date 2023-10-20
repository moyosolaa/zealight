import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zealight_test/school_model.dart';

class SchoolsProvider extends ChangeNotifier {
  List<SchoolModel> _schools = [];
  List<SchoolModel> get schools => _schools;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  List<SchoolModel> get filteredSchools {
    if (searchQuery.isEmpty) {
      return _schools;
    } else {
      return _schools
          .where((school) => school.name?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false)
          .toList();
    }
  }

  SchoolsProvider() {
    fetchSchools();
  }

  Future<void> fetchSchools() async {
    _isLoading = true;
    notifyListeners();
    final response = await http.get(Uri.parse('http://universities.hipolabs.com/search?country=United+States'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _schools = (data as List).map((json) => SchoolModel.fromJson(json)).toList();
      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = false;
      notifyListeners();
      throw Exception('Failed to fetch data');
    }
    _isLoading = false;
    notifyListeners();
  }
}
