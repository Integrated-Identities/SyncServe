import 'package:flutter/material.dart';

// WELCOME BACK
class AppStyle {
  static const TextStyle headingText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Colors.black,
  );

// HINTTEXT FOR INPUT FIELDS
  static final ButtonStyle hintTextButton = ButtonStyle(
    foregroundColor: WidgetStateProperty.all(Colors.grey),
    textStyle: WidgetStateProperty.all(labelText),
  );

// ELEVATED BUTTON STYLE
  static ButtonStyle elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 237, 125, 125),
      minimumSize: const Size(double.infinity, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
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

// CUSTOMER DETAIL PAGE TEXTFORMFIELD
  static InputDecoration inputDecorationWithLabel(
    String label, {
    bool isRequired = false,
  }) {
    return InputDecoration(
      helperText: ' ',
      alignLabelWithHint: true,
      fillColor: Colors.white,
      filled: true,
      labelText: isRequired ? '$label*' : label,
      labelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
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

  // APP BAR AND NAVIGATION BAR BACKGROUND COLOR
  static const appBarAndNavBarColor = Colors.white;

  // CHECKBOX TEXT STYLE
  static const TextStyle labelText = TextStyle(
    fontSize: 18,
    color: Colors.black,
  );

  // BOTTOM AREA PADDING FOR ELEVATED BUTTON
  static const EdgeInsets bottomAreaPadding = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 10,
  );

  // CHECKBOX THEME FOR CHECKBOX STYLE
  static CheckboxThemeData checkboxThemeData = CheckboxThemeData(
    fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Color.fromARGB(255, 237, 125, 125);
      }
      return Colors.white;
    }),
    checkColor: WidgetStateColor.resolveWith((states) => Colors.white),
  );

  // SECTION TITLE TEXT STYLE
  static const TextStyle sectionTitleText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // SECTION TITLE PADDING
  static const EdgeInsets sectionTitlePadding =
      EdgeInsets.symmetric(horizontal: 10);

  // SECTION CONTENT PADDING
  static const EdgeInsets sectionContentPadding =
      EdgeInsets.symmetric(horizontal: 5);

  // DIVIDER COLOR
  static const Color dividerColor = Color.fromARGB(255, 100, 100, 100);
}
