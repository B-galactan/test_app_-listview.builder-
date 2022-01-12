import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 100, adapterName: "ItemAdapter")
class Item extends HiveObject{
  
  @HiveField(0)
   dynamic itemName;
  
  @HiveField(1)
   dynamic itemDetail;

  get getName => this.itemName;
  get getDetail => this.itemDetail;


Item({this.itemName, this.itemDetail});

    setName(dynamic name){
      this.itemName = name;
    }

  setDetail(dynamic name){
      this.itemName = name;
      }




}