import 'package:flutter/material.dart';
import 'package:news_app/providers/get_business_new_provider.dart';
import 'package:news_app/providers/get_news_provider.dart';
import 'package:news_app/providers/get_sports_new_provider.dart';
import 'package:news_app/providers/get_tech_new_provider.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GetNewsProvider>(
          create: (context) => GetNewsProvider(),
        ),
        ChangeNotifierProvider<GetBusinessNewsProvider>(
          create: (context) => GetBusinessNewsProvider(),
        ),
        ChangeNotifierProvider<GetTechNewsProvider>(
          create: (context) => GetTechNewsProvider(),
        ),
        ChangeNotifierProvider<GetSportsNewsProvider>(
          create: (context) => GetSportsNewsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Homescreen(),
      ),
    );
  }
}
