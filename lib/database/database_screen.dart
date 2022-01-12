import 'package:flutter/material.dart';
import 'package:test_app/food_notifier.dart';
import 'package:provider/provider.dart';
import 'package:test_app/item.dart';



class DataBaseScreen extends StatefulWidget {
  const DataBaseScreen({ Key? key }) : super(key: key);

  @override
  _DataBaseScreenState createState() => _DataBaseScreenState();
}

class _DataBaseScreenState extends State<DataBaseScreen> {
 
     
    final nameController = TextEditingController(); 
    final detailController2 = TextEditingController(); 


    
  
  @override
  Widget build(BuildContext context) {
    FoodNotifier myNotifier = Provider.of<FoodNotifier>(context);

    

    void clearingText(){
      nameController.clear();
    }

    void clearingText2(){
      detailController2.clear();
    }

    

    return Scaffold(
      
      appBar: AppBar(title: Text('DataBase Screen'),),

      body: Column(
        children: [
          Expanded(
            child: Center(
              child: RaisedButton(
                child:Text("Show"),
                color: Colors.purple,
                onPressed: (){
                    Navigator.pushNamed(context, '/dataBaseList');
                },
                 ) ,
              ),
            ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                child:Text("Add"),
                color: Colors.greenAccent,
                onPressed: (){
                
                     showDialog(
                       context: context,
                       builder: (context) {
                         return Dialog(
                           child: Container(
                             child: Card(
                               child: Column(
                                 mainAxisSize: MainAxisSize.min,
                                 children: [
                                   TextField(
                                     controller: nameController,
                                     decoration: const InputDecoration(
                                     labelText: "Item name",
                                   ),
                                   ),
                                   TextField(
                                     controller: detailController2,
                                     decoration:const InputDecoration( 
                                     labelText: "Item Detail",

                                   ),
                                   ),
                                   ElevatedButton(
                                     onPressed: () {
                                       if(nameController.text.isNotEmpty || detailController2.text.isNotEmpty){
                                           
                                          myNotifier.addToBox(Item(itemName: nameController.text,
                                                              itemDetail: detailController2.text));
                                      
                                      myNotifier.openMyBox();
                                     
                                     Navigator.pop(context);
                                     clearingText();
                                     clearingText2();
                                       
                                       } else {
                                     Navigator.pop(context);
                                       }
                                   }, 
                                   child: const Text("Submit"))
                                 ],
                               ) ,
                               ),
                           ),
                         );
                       }
                     );
                },
                
                 ) , 
                 
                 RaisedButton(
                child:Text("Delete"),
                color: Colors.lightBlue,
                onPressed: (){

                },
                 ) ,

                ],
                ),
            )
        ],
        ),
    );
    
  }
}