import 'package:flutter/material.dart';
import 'homepage.dart';
import 'profilmhs.dart';
import 'galery.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomePage(),
  '/profile': (context) => const ProfilePage(),
  '/gallery': (context) => const GalleryPage(),
};
