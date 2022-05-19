import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/example_one_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({Key? key}) : super(key: key);

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  
  // double value = 1.0;

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscribe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: ((context, value, child) {
            return Slider(
            min: 0,
            max: 1,
            value:value.value , onChanged: (val){
              // print(value);
              value.setValue(val);
              // value = val;
            // setState(() {
              
            // });
          }
          );
          }
          )
          ),
          
           Consumer<ExampleOneProvider>(builder: ((context, value, child) {
            return Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(value.value)
                  ),
                  child: const Center(
                    child: Text("Container 1"),
                  ),
                ),
              ),
               Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(value.value)
                  ),
                  child: const Center(
                    child: Text("Container 2"),
                  ),
                ),
              ),
            ],
          );
          }
          )
          ),
          
        ],
      ),
    );
  }
}