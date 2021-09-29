//@dart=2.9

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customerInfoPage.dart';


class DanhGiaPage extends StatefulWidget {
  const DanhGiaPage({Key key,  this.nameBt, this.clNhanVien, this.clSanPham,
   this.kgCuaHang, this.giaTien, this.tdPhucVu}) : super(key: key);

  final String nameBt;
  final double clNhanVien,clSanPham,kgCuaHang,giaTien,tdPhucVu;

  @override
  _DanhGiaPageState createState() => _DanhGiaPageState();
}

class _DanhGiaPageState extends State<DanhGiaPage> {

  final TextEditingController _feedbackController = TextEditingController();
  void _customerInfoPage(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CustomerInfoPage(fbText: _feedbackController.text, nameBt: widget.nameBt,clNhanVien: widget.clNhanVien,clSanPham: widget.clSanPham,kgCuaHang: widget.kgCuaHang,giaTien: widget.giaTien,tdPhucVu: widget.tdPhucVu)));
  }
  void _homePage(BuildContext context){
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.orangeAccent,
        title: Text('CHÚNG TÔI CÓ THỂ LÀM GÌ ĐỂ BẠN HÀI LÒNG?',
          style: TextStyle(
              fontSize: 30,
              color: Colors.black54
          ),),
        //centerTitle: true,
      ),
      body:Padding(
        padding: EdgeInsets.all(25),
        child:TextField(
          controller: _feedbackController,
          decoration: InputDecoration(
              labelText: 'Nhận xét của bạn',
              labelStyle: TextStyle(fontSize: 30)
          ),
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: ButtonBar(
          children:[
            ElevatedButton(
              onPressed: ()=>_homePage(context),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                fixedSize: Size.fromWidth(300),
                side: BorderSide(color: Colors.black),
              ), child: Icon(Icons.arrow_left_outlined,
              size: 70,
              color: Colors.orangeAccent,
            ),
              //style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),
            ),

            ElevatedButton(
                onPressed:()=>_customerInfoPage(context),
             //onPressed: ()=> print(widget.clNhanVien),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                ),
                child:Row(
                    children:[
                      Text('TIẾP TỤC',
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_right,
                        size: 70,
                      )
                    ]
                )
            )

          ]
      ),

    );
  }
}



