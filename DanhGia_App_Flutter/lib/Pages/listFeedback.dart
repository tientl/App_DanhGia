//@dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuoi_ki_moblie/Customize/show_alert_Dialog.dart';
import 'package:cuoi_ki_moblie/service/auth_base.dart';
import 'package:cuoi_ki_moblie/service/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homePage.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key key, @required this.auth, @required this.onSignOut})
      : super(key: key);
  final AuthBase auth;
  final VoidCallback onSignOut;


  Future<void> DeleteRate(String id) async {
    final s = FirebaseFirestore.instance;
    s.collection('Rate').doc(id).delete();

  }
  void _HomePage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }
  Future<void> _confirmDelete(BuildContext context,String id) async{
    final didRequestSignOut = await showAlertDialog(context,
        title: 'Xóa dữ liệu',
        content: 'BẠn có chắc chắn muốn xóa?',
        cancelActionText: 'Cancel',
        defaultActionText: 'XÓA');
    if(didRequestSignOut == true){
      DeleteRate(id);
    }
  }
  Future<void> _confirmLogout(BuildContext context) async{
    final didRequestSignOut = await showAlertDialog(context,
        title: 'ĐĂNG XUẤT',
        content: 'BẠn có muốn đăng xuất?',
        cancelActionText: 'Cancel',
        defaultActionText: 'Đăng xuất');
    if(didRequestSignOut == true){
      _HomePage(context);
    }
  }

  Row rateRow(String text,doc,bool star){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text+':',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 100,),
          Text(doc.toString(),
              style: TextStyle(fontSize: 20)),
          star==true?
          Icon(Icons.star,color: Colors.deepOrange,):Text('')
        ]
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        title: Text(
          "DANH SÁCH ĐÁNH GIÁ CỦA KHÁCH HÀNG",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () {
              _confirmLogout(context);
            },
            child: Icon(
              Icons.logout,
              size: 50,
            ),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Rate').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return Padding(
              padding: const EdgeInsets.only(left: 100, right: 100, top: 50),
              child: ListView(
                children: snapshot.data.docs.map((doc) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.save,size: 35,color: Colors.indigo,),
                      title: Text(
                        doc['rate'],
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        'Tên: ' + doc['name'],
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: ElevatedButton(
                        onPressed:()=> _confirmDelete(context,doc.id),
                        child:Icon(Icons.delete) ,
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("NỘI DUNG",
                                textAlign: TextAlign.center,
                                style: TextStyle(color:Colors.indigo),),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    rateRow('Tên', doc['name'],false),
                                    SizedBox(height: 30,),
                                    rateRow('Đánh giá', doc['rate'],false),
                                    SizedBox(height: 30,),
                                    rateRow('SĐT', doc['numberPhone'],false),
                                    SizedBox(height: 30,),
                                    rateRow('Góp ý', doc['feedback'],false),
                                    SizedBox(height: 30,),
                                    doc['chatluong']!=null?
                                    rateRow('Chát lượng nhân viên', doc['chatluong']['clNhanVien'],true):Text(''),
                                    SizedBox(height: 30,),
                                    doc['chatluong']!=null?
                                    rateRow('Chất lượng sản phầm', doc['chatluong']['clSanPham'],true):Text(''),
                                    SizedBox(height: 30,),
                                    doc['chatluong']!=null?
                                    rateRow('Chát lượng nhân viên', doc['chatluong']['clNhanVien'],true):Text(''),
                                    SizedBox(height: 30,),
                                    doc['chatluong']!=null?
                                    rateRow('Không gian cửa hàng', doc['chatluong']['kgCuaHang'],true):Text(''),
                                    SizedBox(height: 30,),
                                    doc['chatluong']!=null?
                                    rateRow('Thái độ phục vụ', doc['chatluong']['tdPhucVu'],true):Text(''),
                                    SizedBox(height: 30,),
                                    doc['chatluong']!=null?
                                    rateRow('Giá tiền', doc['chatluong']['giaTien'],true):Text(''),
                                  ],
                                ),
                              );
                            });
                      },

                    ),
                  );
                }).toList(),
              ),
            );
        },
      ),
    );
  }
}
