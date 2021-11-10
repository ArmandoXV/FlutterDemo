import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Bloc/AuthRepository.dart';
import 'Screens/LoginScreen.dart';
import 'config/routes/Routs.dart';
import 'config/themes/AppTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme(),
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: LoginScreen(),
      ),
      routes: route,
    );
  }
}
