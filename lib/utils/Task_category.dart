import 'package:flutter/material.dart';
enum TaskCategories {
  education(Icons.school, Colors.blueGrey),
  health(Icons.favorite, Colors.redAccent),
  shopping(Icons.shopping_cart,Colors.lightBlueAccent),
  home(Icons.home,Colors.orangeAccent),
  personal(Icons.person,Colors.purple),
  lifestyle(Icons.spa,Colors.greenAccent),
  Times(Icons.calendar_month_sharp,Colors.teal),
  Others(Icons.note,Colors.amber);


  static TaskCategories stringToCategory(String value){
    try{
      return TaskCategories.values.firstWhere(
          (category)=>category.name==value
      );
    }
    catch(e){
      return TaskCategories.Others;
    }
  }


  final IconData icon;
  final Color color;
  const TaskCategories(this.icon,this.color);
}