import 'package:flutter/material.dart';

class LocationService {
  static const List<String> yemeniCities = [
    'صنعاء', 'عدن', 'تعز', 'الحديدة', 'المكلا', 'إب', 'ذمار',
    'البيضاء', 'سيئون', 'زبيد', 'ريمه', 'عمران', 'حجة', 'صعدة',
    'المحويت', 'لحج', 'أبين', 'شبوة', 'المهرة', 'سقطرى', 'الجوف', 'مارب',
  ];

  static List<String> getCities() => yemeniCities;
  static List<String> searchCities(String query) {
    if (query.isEmpty) return yemeniCities;
    return yemeniCities.where((city) => city.contains(query)).toList();
  }
}
