import 'package:flutter/material.dart';
import 'package:version_0/Screens/HomeScreen.dart';

Map<String, WidgetBuilder> get route {
  return <String, WidgetBuilder>{
    "/home": (BuildContext context) => new Home(),
  };
}
