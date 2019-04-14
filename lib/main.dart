import 'package:flutter/material.dart';
import 'package:flwps0/fetchdata.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wordpress primer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FetchData(),
    );
  }
}


// theme: ThemeData( // adding a theme

//     brightness: Brightness.dark, //changing the theme to dark
//         primaryColor: Colors.lightBlue[900], // color change for links 
//         accentColor: Colors.cyan[600], // i dont know 
//         fontFamily: 'NotoSansArabic' ,
//         tabBarTheme: TabBarTheme(
        
//         ),
//         iconTheme: IconThemeData(

//         ),
                
        
      
//       ) ,

