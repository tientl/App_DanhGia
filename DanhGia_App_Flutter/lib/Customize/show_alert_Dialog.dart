//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool> showAlertDialog(
BuildContext context,{
    @required String title,
    @required String content,
    String cancelActionText,
    @required String defaultActionText,
}){
  return showDialog(
      context: context,
    builder: (context) => AlertDialog(
      title: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      content: Text(content,style: TextStyle(fontSize: 20),),
      actions:<Widget> [
        if(cancelActionText != null)
          TextButton(
            child: Text(cancelActionText,style:TextStyle(fontSize: 18)),
            onPressed: () =>Navigator.of(context).pop(false),
          ),
        TextButton(
            onPressed: () =>Navigator.of(context).pop(true),
            child: Text(defaultActionText,style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold)))
      ],
    )
  );
}

