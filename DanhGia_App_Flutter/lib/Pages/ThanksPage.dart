
import 'package:cuoi_ki_moblie/Pages/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({Key? key}) : super(key: key);


  void _signOut(BuildContext context)  {
    try {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
    }
    catch (e) {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: (){_signOut(context);},
              style: ElevatedButton.styleFrom(
                  primary: Colors.white
              ),
              child: Icon(Icons.home,
                size: 70,
                color: Colors.orangeAccent,
              ))
        ],
        title: Text('XIN CẢM ƠN QUÝ KHÁCH ĐÃ ĐÁNH GIÁ',
        style: TextStyle(fontSize: 30,color: Colors.black),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 150,
        centerTitle: true,

      ),
      body:Container(
        child:Column(
          children: [
            Image.asset('images/imageThanks.gif'),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: (){_signOut(context);},
              style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                fixedSize: Size(250, 90),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              ),
              child: Text('MÀN HÌNH CHÍNH',
              style: TextStyle(fontSize: 23,color: Colors.black54),),
            ),
          ],
        )
    )
    );

  }
}
