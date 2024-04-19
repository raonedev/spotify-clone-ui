import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context,required bool isError,required String text}) {
  final snackBar = SnackBar(
    content: Text(text,style: const TextStyle(color: Colors.white),),
    backgroundColor: isError?Colors.red:Colors.green,
    closeIconColor: Colors.white,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}