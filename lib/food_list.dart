import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'food_list.dart';
import 'food_notifier.dart';

class ListPage extends StatelessWidget {
  const ListPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
   FoodNotifier myNotifier = Provider.of<FoodNotifier>(context);


    return Scaffold(
      appBar: AppBar(
       title: Text("Provider Test") 
        ,),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical ,
          child: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              children: [
                SizedBox( height: 200,
                child: ListView.builder(
                  itemCount: foodNotifier.foodList.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      title: Text(foodNotifier.foodList[index].foodName),
                      subtitle: Text(foodNotifier.foodList[index].foodColor),
                      
                    ),
                  ),
                  
                  ),
                ),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    "DataBase",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {

                   Navigator.pushNamed(context, '/dataBase');
                   myNotifier.openMyBox();
                  },
                ),
        
                RaisedButton(
                  child: Text(
                    "Reset List",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    foodNotifier.resetList();
                  },
                )
              ],
            ),
            ),
        ),
    );
  }
}




