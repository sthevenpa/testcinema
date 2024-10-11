import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:testcinema/config/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:testcinema/config/theme/app_theme.dart';

Future<void> main() async{
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child:TestCinema()));
}

class TestCinema extends StatelessWidget {
  const TestCinema({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Crispetamark',
      theme: AppTheme().getTheme()
    );
  }
}

