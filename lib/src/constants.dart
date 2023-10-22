import 'package:flutter/material.dart';

InputDecoration formFieldStyle() => const InputDecoration(
	labelStyle: TextStyle(color: Color(0xffe8e8e8)),
	border: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(6.0)),
		borderSide: BorderSide(color: Color(0xffe8e8e8)),
	),
	enabledBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(6.0)),
		borderSide: BorderSide(color: Color(0xffe8e8e8)),
	),
	focusedBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(6.0)),
		borderSide: BorderSide(color: Color(0xffe8e8e8)),
	),
	hintStyle: TextStyle(color: Color(0xffe8e8e8)),
);

ButtonStyle primaryButtonStyle() => ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff007eb9)),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
);

ButtonStyle accentButtonStyle() => ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff00d6d6)),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
);

ButtonStyle outlineButtonStyle() => ButtonStyle(
	backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
	foregroundColor: MaterialStateProperty.all<Color>(const Color(0xff00d6d6)),
	side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: Color(0xff00d6d6))),
	padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
	shape: MaterialStateProperty.all<RoundedRectangleBorder>(
		RoundedRectangleBorder(
			borderRadius: BorderRadius.circular(5.0),
		),
	),
);

ButtonStyle textButtonStyle() => ButtonStyle(
	foregroundColor: MaterialStateProperty.all<Color>(const Color(0xff00d6d6)),
	padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
);

TextStyle titleStyle() => const TextStyle(
	fontSize: 20,
	fontWeight: FontWeight.bold,
	color: Color(0xff007eb9),
);

TextStyle cardTitleStyle() => const TextStyle(
	fontSize: 16,
	color: Color(0xff007eb9),
);