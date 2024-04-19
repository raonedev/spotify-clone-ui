import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> showAlertDialog({required BuildContext context,required String title,required String subtitle ,required VoidCallback onTap}) {
  return showDialog(context: context, builder: (context){
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(subtitle),
      actions: [
        CupertinoButton(child: const Text("Ok"), onPressed: (){
          Navigator.pop(context);
          onTap();
        })
      ],
    );
  });
}