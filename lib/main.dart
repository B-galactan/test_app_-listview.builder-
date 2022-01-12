import 'dart:io';
import 'package:test_app/database/database_list.dart';
import 'package:test_app/database/database_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'food_notifier.dart';
import 'package:provider/provider.dart';
import 'food_list.dart';
import 'home_page.dart';
import 'package:hive/hive.dart';
import 'package:test_app/item.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    Directory appDirrectory = await getApplicationDocumentsDirectory();
    Hive.init(appDirrectory.path);
    Hive.registerAdapter(ItemAdapter());
    

    await Hive.openBox("shopItems");
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FoodNotifier()),
      ],


      child: SeriousBloc()
      )
      );
}

class SeriousBloc extends StatelessWidget {
  
  
  
   SeriousBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      
   
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/page1' : (context) => ListPage(),
        '/dataBase': (context) => DataBaseScreen(),
        '/dataBaseList': (context) => DataBaseList(),

      },
      theme: ThemeData(
          primaryColor: new Color(0xff075E54),
          accentColor:  new Color(0xff25D366)
      ),
      home: HomePage(),
    );
  }
}
