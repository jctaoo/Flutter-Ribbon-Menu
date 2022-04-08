// Global button theme for mouse cursor
import "package:flutter/material.dart";

ButtonStyle kApplicationMenuButtonThemeData = kBasicButtonStyle.copyWith(
  textStyle: MaterialStateProperty.resolveWith(
    (states) => const TextStyle(fontSize: 11.5),
  ),
);

ButtonStyle kBasicButtonStyle = ButtonStyle(
  mouseCursor:
      MaterialStateProperty.resolveWith((states) => SystemMouseCursors.basic),
  foregroundColor: MaterialStateProperty.resolveWith(
    (states) {
      if (states.contains(MaterialState.disabled)) {
        return const Color.fromARGB(255, 160, 160, 160);
      }

      return const Color.fromARGB(255, 44, 44, 44);
    },
  ),
  // TODO: This needs to be specific to ribbon buttons.
  // Or else the tab buttons look like shit.
  // overlayColor: MaterialStateProperty.resolveWith(
  //   (states) => const Color.fromARGB(255, 202, 202, 202),
  // ),
);
