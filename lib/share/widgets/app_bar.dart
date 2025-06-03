import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_ahora/core/navigation/routes.dart';
import 'package:meta_ahora/share/widgets/button.dart';

getNotesAppBar({
  required BuildContext context, 
  showAddButton = false,
  String? userId
}) {
  return AppBar(
      backgroundColor: Color(0xFF232323),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("METAhora", style: TextStyle(color: Colors.white),),
          if (showAddButton && userId != null)
            ElevatedButton(
              onPressed: () {
                context.go(Routes.addGoal.getParametredRoute(userId));
              }, 
              child: Icon(Icons.add, color: Color(ButtonColors.primary.color)),
            )
        ],
      ),
    );
}
