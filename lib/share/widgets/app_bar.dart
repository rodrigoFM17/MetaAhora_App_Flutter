import 'package:flutter/material.dart';

getNotesAppBar({required context, showAddButton = false}) {
  return AppBar(
      backgroundColor: Color(0xFF232323),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("METAhora", style: TextStyle(color: Colors.white),),
          if (showAddButton)
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/login/add");
              }, 
              child: Icon(Icons.add),
            )
        ],
      ),
    );
}
