import 'package:cuoi_ki_moblie/service/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Email_sign_in_form.dart';


class EmailSignInPage extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        title: Text('ĐĂNG NHẬP EMAIL',
        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
        ),
        elevation: 2.0,
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 100,left: 100,top:20),
            child:EmailSignInForm(auth:Auth())
        ),
      ),

    );
  }


}