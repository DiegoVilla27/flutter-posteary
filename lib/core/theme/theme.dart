import 'package:flutter/material.dart';

/// A custom theme class that provides a dark theme configuration
/// with a deep purple accent color scheme.
/// 
/// The `get` method returns a `ThemeData` object configured with
/// a dark brightness and a color scheme seeded with deep purple accent.
class ThemeCustom {
  ThemeCustom();

  ThemeData get() {
    return ThemeData(
      colorSchemeSeed: Colors.deepPurpleAccent,
      brightness: Brightness.dark,
    );
  }
}