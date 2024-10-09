import 'package:flutter/material.dart';

import 'package:testcinema/config/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:testcinema/config/theme/app_theme.dart';

Future<void> main() async{
  await dotenv.load(fileName: ".env");
  runApp(const TestCinema());
}

class TestCinema extends StatelessWidget {
  const TestCinema({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'TestCinema',
      theme: AppTheme().getTheme()
    );
  }
}

