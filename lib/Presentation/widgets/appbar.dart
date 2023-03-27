
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget ({super.key, required this. titles, required this.leading, required this.trailing});
  
 final String titles;
 final IconData leading;
 final IconData trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon:Icon( leading),),
      title: Text(titles),
      trailing: IconButton(onPressed: (){}, icon: Icon(trailing)),

    );
     
  }
}