import 'package:flutter/material.dart';

abstract class IApplicationMenuButton extends StatelessWidget {
  const IApplicationMenuButton({Key? key}) : super(key: key);

  String get label;
  Function()? get onPressed;
  Icon get icon;
}