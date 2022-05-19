//Done By myself

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/example_two_provider.dart';
import 'package:provider_tutorials/screens/examples/favourite_example/selectedItemFav.dart';


class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  List<int> selectedItem = [];
 
  @override
  Widget build(BuildContext context) {
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
              itemCount: 10,
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
