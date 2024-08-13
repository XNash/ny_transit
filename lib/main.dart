import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ny_transit/presentation/pages/inscription_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Poppins",
        useMaterial3: true,
        primaryColor: const Color(0xff67bed1),
      ),
      debugShowCheckedModeBanner: false,
      home: const InscriptionPage(),
    );
  }
}
