import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/example_two_provider.dart';

class SelectedFav extends StatefulWidget {
  const SelectedFav({Key? key}) : super(key: key);

  @override
  State<SelectedFav> createState() => _SelectedFavState();
}

class _SelectedFavState extends State<SelectedFav> {
  @override
 
  Widget build(BuildContext context) {
    final favProvider = Provider.of<ExampleTwoProvider>(context);
    // final exampleTwoProvider  = Provider.of<ExampleTwoProvider>(context);
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedFav()));
            },
            child: Icon(Icons.favorite)),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favProvider.selectedValue.length,
              itemBuilder: ((context, index) {
              return Consumer<ExampleTwoProvider>(
                builder: ((context, value, child) {
                  return ListTile(
                  onTap: () {

                    if(value.selectedValue.contains(index)){
                      value.removeValue(index);
                    }else{
                      value.addValue(index);
                    }
                    // selectedItem.add(index);
                    
              
                    // setState(() {
                      
                    // });
                  },
                  title: Text("Item "+ index.toString()),
                  trailing: Icon(
                    value.selectedValue.contains(index)?  Icons.favorite:Icons.favorite_outline),
                );
                }),
                
              );
            })),
          )
        ],
      ),
    );
  }
}