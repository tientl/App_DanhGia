//@dart=2.9
import 'package:cuoi_ki_moblie/Pages/ThanksPage.dart';
import 'package:cuoi_ki_moblie/service/auth.dart';
import 'package:cuoi_ki_moblie/service/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CustomerInfoPage extends StatefulWidget {
  const CustomerInfoPage({Key key, @required this.fbText, @required this.nameBt, this.clNhanVien, this.clSanPham, this.kgCuaHang, this.giaTien, this.tdPhucVu,}) : super(key: key);

  final String fbText,nameBt;
  final double clNhanVien,clSanPham,kgCuaHang,giaTien,tdPhucVu;
  @override
  _CustomerInfoPageState createState() => _CustomerInfoPageState();
}

class _CustomerInfoPageState extends State<CustomerInfoPage> {

  Future<void> UpdateDatabase() async {
    if(widget.nameBt =='Yêu Thích' || widget.nameBt =='Hài Lòng'||widget.nameBt =='Tốt')
      {
        await DatabaseService().updatedDataGood(widget.nameBt,_nameController.text,widget.fbText,
            int.parse(_numberPhoneController.text));
      }
    else{
      await DatabaseService().updatedDataBad(widget.nameBt,_nameController.text,widget.fbText,
          int.parse(_numberPhoneController.text),
          widget.clNhanVien,widget.clSanPham,widget.kgCuaHang,widget.giaTien,widget.tdPhucVu);
    }

    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ThanksPage()));
  }

  void checkNull(){
    String txtName= _nameController.text;
    String txtPhone = _numberPhoneController.text;
    if(txtName==''||txtPhone==''){

    }

  }
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberPhoneController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          toolbarHeight: 150,
          title: Text(
            'VUI LÒNG ĐIỀN THÔNG TIN ĐỂ CHÚNG TÔI PHỤC VỤ TỐT HƠN:',
            style: TextStyle(
                fontSize: 30,
                color: Colors.black54
            ),
          ),
        ),
        body:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500,
              child: TextField(
                style: TextStyle(fontSize: 25),
                controller: _nameController,
                decoration: InputDecoration(
                    labelText: 'Nhập tên của quý khách:',
                    labelStyle: TextStyle(fontSize: 30)
                ),
              ),
            ),
            SizedBox(width: 100,),
            Container(
              width: 500,
              child: TextField(
                style: TextStyle(fontSize: 25),
                controller: _numberPhoneController,
                decoration: InputDecoration(
                    labelText: 'Nhập SĐT của quý khách:',
                    labelStyle: TextStyle(fontSize: 30)
                ),
                keyboardType: TextInputType.numberWithOptions(
                  signed: false,
                  decimal: false,
                ),
              ),
            )

          ],
        ),
        floatingActionButton: ButtonBar(
            children:[
              ElevatedButton(
                onPressed:() {Navigator.pop(context);},
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
                  onPressed: UpdateDatabase,
                  //onPressed: ()=> print(widget.clSanPham),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                  ),
                  child:Row(
                      children:[
                        Text('GỬI PHẢN HỒI ',
                          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_right,
                          size: 70,
                        )
                      ]
                  )
              )

            ]
        )
    );
  }

}

