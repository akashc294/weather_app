import 'package:flutter/material.dart';
import 'package:weather_app/constants/colors.dart';

class CustomPopUp{
   static Widget popUpMenu(){
     return PopupMenuButton<String>(
       icon:Icon(Icons.more_vert_outlined,color: AppThemeColors.white,),
       onSelected: (value) {
         // Handle menu item selection here
         print('Selected: $value');
       },
       itemBuilder: (BuildContext context) => [
         const PopupMenuItem<String>(
           value: 'Option 1',
           child: Text('Option 1'),
         ),
         const PopupMenuItem<String>(
           value: 'Option 2',
           child: Text('Option 2'),
         ),
         const PopupMenuItem<String>(
           value: 'Option 3',
           child: Text('Option 3'),
         ),
       ],
     );
   }
}