import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);

    Timer.periodic(Duration(seconds: 2), (timer) { 
      countProvider.setCount();
    });
  }
  @override
  Widget build(BuildContext context) {
    //initializing the provider
    final countProvider = Provider.of<CountProvider>(context, listen: false);

    //It is even building full widgets let's move to consumer
    print('Build');

    return Scaffold(
        appBar: AppBar(
          title: const Text("Provider"),
        ),
        body: Center(
          child: Consumer<CountProvider>(builder: (context, value, child) {
            print("Only this will rebuild");
            return Text(
              value.count.toString(),
              style: TextStyle(fontSize: 50),
            );
          }),
        ),
    floatingActionButton:
    FloatingActionButton(
      onPressed: () {
        countProvider.setCount();
      },
      child: Icon(Icons.add),
    ));
  }
}
