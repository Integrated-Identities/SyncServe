import 'package:flutter/material.dart';

// APP COLORS
class AppColors {
  // Primary brand colors - Coral theme
  static const Color primaryPink =
      Color.fromARGB(235, 254, 108, 94); // Custom coral-red

  // Neutral colors
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
  static const Color lightGrey = Color.fromARGB(255, 100, 100, 100);
}

// WELCOME BACK
class AppStyle {
  static const TextStyle headingText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Colors.black,
    fontFamily: 'Noto Sans',
  );

// HINTTEXT FOR INPUT FIELDS
  static final ButtonStyle hintTextButton = ButtonStyle(
    foregroundColor: WidgetStateProperty.all(Colors.grey),
    textStyle: WidgetStateProperty.all(labelText),
  );

// ELEVATED BUTTON STYLE
  static ButtonStyle primaryElevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryPink,
      minimumSize: const Size(double.infinity, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Noto Sans',
      ),
      foregroundColor: Colors.white,
    );
  }

// EMAIL AND PASSWORD TEXTFORMFIELD
  static InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
    );
  }

  // INPUT DECORATION WITH LABEL and
  static InputDecoration inputDecorationWithLabel(
    String label, {
    String? suffix,
    bool isRequired = false,
  }) {
    return InputDecoration(
      suffixText: suffix,
      helperText: ' ',
      alignLabelWithHint: true,
      fillColor: Colors.white,
      filled: true,
      labelText: isRequired ? '$label*' : label,
      labelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'Noto Sans',
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 22, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: Colors.red,
          width: 2,
        ),
      ),
    );
  }

  // APP BAR AND NAVIGATION BAR CARD AND CANVAS BACKGROUND COLOR
  static const appBarNavBarCardAndCanvasColor = Colors.white;

  // CHECKBOX TEXT STYLE
  static const TextStyle labelText = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontFamily: 'Noto Sans',
  );

  static const TextStyle titleOnCard = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontFamily: 'Noto Sans',
  );

  // SECTIONTITLE TEXT STYLE
  static TextStyle sectionTitleText = labelText.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  // CHECKBOX THEME FOR CHECKBOX STYLE
  static CheckboxThemeData checkboxThemeData = CheckboxThemeData(
    fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryPink;
      }
      return Colors.white;
    }),
    checkColor: WidgetStateColor.resolveWith((states) => Colors.white),
  );

  // DIVIDER COLOR
  static const Color dividerColor = Color.fromARGB(255, 100, 100, 100);

  // STYLE OF INCREMENT DECREMENT BUTTON OF QUANITYSELECTOR
  static ButtonStyle quantitySelectorButtonStyle() {
    return primaryElevatedButtonStyle().copyWith(
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      padding: WidgetStateProperty.all(
        const EdgeInsets.all(8),
      ),
      minimumSize: WidgetStateProperty.all(
        const Size(40, 40),
      ),
      maximumSize: WidgetStateProperty.all(
        const Size(40, 40),
      ),
    );
  }

  // SEGMENTED BUTTON COLOR STYLES
  static ButtonStyle segmentedButtonStyle() {
    return ButtonStyle(
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      backgroundColor: WidgetStateColor.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryPink;
          }
          return Colors.white;
        },
      ),
      foregroundColor: WidgetStateColor.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white;
          }
          return Colors.black;
        },
      ),
    );
  }
}
