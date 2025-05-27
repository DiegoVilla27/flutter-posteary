import 'package:flutter/material.dart';
import 'package:flutter_posteary/core/states/scaffold/scaffold_key_state.dart';

/// Defines the types of SnackBars that can be displayed, each with a specific
/// style and icon. The available types are: info, success, error, and warning.
enum SnackbarType { info, success, error, warning }

/// A utility class for displaying custom SnackBars with predefined styles
/// based on the SnackbarType. Provides methods to build and display SnackBars
/// with specific icons, colors, and durations.
///
/// The `open` method displays a SnackBar with a specified title and type,
/// optionally accepting a custom duration. The SnackBar includes an icon
/// corresponding to the type, a bold title, and a close button.
class SnackBarCustom {
  /// A static map that associates different types of snackbars with their corresponding colors.
  ///
  /// This map is used to define a color scheme based on the type of message being displayed
  /// in the Snackbar. Each `SnackbarType` is mapped to a color that helps visually distinguish
  /// the message type for the user. The available types are:
  /// - `info`: Blue color for informational messages.
  /// - `success`: Green color for success messages.
  /// - `warning`: Orange color for warning messages.
  /// - `error`: Red color for error messages.
  static const _colors = {
    SnackbarType.info: Colors.blue,
    SnackbarType.success: Colors.green,
    SnackbarType.warning: Colors.orange,
    SnackbarType.error: Colors.red,
  };

  /// A static map that associates different types of snackbars with their corresponding icons.
  ///
  /// This map is used to define an icon for each type of message displayed in the Snackbar.
  /// Each `SnackbarType` is mapped to an icon that helps visually represent the message type.
  /// The available types are:
  /// - `info`: Info icon (rounded) for informational messages.
  /// - `success`: Check-circle icon for success messages.
  /// - `warning`: Warning icon (rounded) for warning messages.
  /// - `error`: Error icon (rounded) for error messages.
  static const _icons = {
    SnackbarType.info: Icons.info_rounded,
    SnackbarType.success: Icons.check_circle,
    SnackbarType.warning: Icons.warning_rounded,
    SnackbarType.error: Icons.error_rounded,
  };

  /// Builds a custom SnackBar with a specified title and type.
  ///
  /// The SnackBar includes an icon and color corresponding to the given
  /// `SnackbarType`, a bold title, and a close button. The default duration
  /// is 8 seconds, but a custom duration can be provided. The SnackBar
  /// is displayed with floating behavior.
  ///
  /// - Parameters:
  ///   - title: The title text to display in the SnackBar.
  ///   - type: The type of the SnackBar, determining its style and icon.
  ///   - duration: Optional custom duration for how long the SnackBar
  ///     should be visible.
  static SnackBar _buildSnackBar(
    String title,
    SnackbarType type, {
    Duration? duration,
  }) {
    duration ??= const Duration(seconds: 8);

    return SnackBar(
      padding: const EdgeInsets.all(10.0),
      content: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(_icons[type], color: _colors[type]),
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
          ),
          GestureDetector(
            onTap:
                () => scaffoldMessengerKey.currentState?.hideCurrentSnackBar(),
            child: Icon(Icons.close_rounded, color: Colors.black, size: 18.0),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      duration: duration,
    );
  }

  /// Displays a SnackBar with a specified title and type.
  ///
  /// The SnackBar is shown using the current ScaffoldMessenger, with an
  /// optional custom duration. It first clears any existing SnackBars before
  /// displaying the new one. The SnackBar includes an icon and style based
  /// on the provided type.
  static open(String title, SnackbarType type, {Duration? duration}) {
    scaffoldMessengerKey.currentState
      ?..clearSnackBars()
      ..showSnackBar(_buildSnackBar(title, type, duration: duration));
  }
}
