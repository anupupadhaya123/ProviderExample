import 'package:flutter/material.dart';
import 'package:provider_tutorials/provider/count_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/example_one_provider.dart';
import 'package:provider_tutorials/provider/example_two_provider.dart';
import 'package:provider_tutorials/screens/examples/count_example.dart';
import 'package:provider_tutorials/screens/examples/example_one.dart';
import 'package:provider_tutorials/screens/examples/favourite_example/favourite_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Single Provider Examples
    // return ChangeNotifierProvider(
    //   create: (_) => CountProvider(),
    //    child: MaterialApp(
    //       title: 'Flutter Demo',
    //       theme: ThemeData(
    //         primarySwatch: Colors.blue,
    //       ),
    //       home: const FavouriteScreen(),
    //     )
    // );
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => ExampleTwoProvider()),

        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const FavouriteScreen(),
        ));
       
    
  }
}

