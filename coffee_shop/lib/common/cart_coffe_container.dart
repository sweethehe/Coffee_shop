import 'package:flutter/material.dart';

Widget cartCoffeeContainer(
  Map coffee,
  VoidCallback onAdd,
  VoidCallback onRemove,
) {
  return ListTile(
    leading: Container(
      height: 70,
      width: 60,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(coffee['image']),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    title: Text(coffee['name']),
    subtitle: Text('\$${coffee['price'] * coffee['quantity']}'),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(icon: Icon(Icons.remove), onPressed: () {
          onRemove();
          }, iconSize: 20,),
        Text(coffee['quantity'].toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        IconButton(icon: Icon(Icons.add), onPressed: () {onAdd();}, iconSize: 20,),
      ],
    ),
  );
}
