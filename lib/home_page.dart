import 'package:flutter/material.dart';
import 'food.dart';
import 'food_notifier.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   late String _currentName;
   late String _currentColor;
  

    final textController = TextEditingController(); 
    final textController2 = TextEditingController();  
  

   void clearingName(){
     textController.clear();
    
   }

   void clearingColor(){
     textController2.clear();
   }




  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    return Scaffold(
      appBar: AppBar( title: Text("Provider")),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(label: Text("Food Name"),),
                onChanged: (text){
                    _currentName = text;
                },
              ),
      
      
      
           TextFormField(
             controller: textController2,
             decoration: InputDecoration(label: Text("Food Color"),
             ),
                onChanged: (text){
                    _currentColor = text;
                },
                
           ),
      
           SizedBox( height: 20,),
           SizedBox( 
             height: 200,
             child: ListView.builder(
               itemCount: foodNotifier.foodList.length,
               itemBuilder: (context, index) => Column(
                 children: [
                   Text(foodNotifier.foodList[index].foodName),
                   Text(foodNotifier.foodList[index].foodColor)
                 ],
               )
               ),
           ),
      
           RaisedButton(
             child: Text("Add Food" ,
             style: TextStyle(color: Colors.purple, fontSize: 16),
             ),
             onPressed: () {
               
                 foodNotifier.addFood(Food(_currentName, _currentColor));
                 clearingName();
                 clearingColor();
               }
             
           ),
      
           RaisedButton(
             child: Text( "Test",
              style: TextStyle( color:  Colors.blue, fontSize: 16),
             ),
             onPressed: () => Navigator.pushNamed(context, '/page1'),
           )
      
      
            ],
          ),
        ),
      ),
      
    );
  }
}