//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'danhgia_page.dart';
import 'homePage.dart';

class RateStarPage extends StatefulWidget {
  const RateStarPage({Key key, @required this.nameBt}) : super(key: key);
  final String nameBt;


  @override
  _RateStarPageState createState() => _RateStarPageState();
}

class _RateStarPageState extends State<RateStarPage> {
  double clNhanVien=0.0 ,clSanPham=0.0,kgCuaHang=0.0,  giaTien=0.0 ,tdPhucVu=0.0;

  void _HomePage(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
  }
  void _danhGiaPage(BuildContext context,String nameBt ){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DanhGiaPage(nameBt:nameBt,clNhanVien: clSanPham,clSanPham: clSanPham,kgCuaHang: kgCuaHang,giaTien: giaTien,tdPhucVu: tdPhucVu,)));

  }
  Row StarRow(String txt){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.done,
              color: Colors.blueAccent,
              size: 40,),
            SizedBox(width: 30,),
            Text(txt,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.indigoAccent),
            ),
          ],
        ),
        SizedBox(width: 300,height: 70,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orangeAccent
            ),
              onPressed: ()=>{_HomePage(context)},
              child: Icon(Icons.home,size: 70,))
        ],
        backgroundColor: Colors.orangeAccent,
        title: Text('MỜI QUÝ KHÁCH ĐÁNH GIÁ DỊCH VỤ',
        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        toolbarHeight: 150,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 100,left: 50,top: 50),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StarRow('Chất lượng nhân viên:'),
                RatingBar.builder(
                  itemSize: 50,
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                       clNhanVien = rating;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StarRow('Chất lượng sản phẩm:'),
                RatingBar.builder(
                  itemSize: 50,
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      clSanPham = rating;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StarRow('Không gian cửa hàng:'),
                RatingBar.builder(
                  itemSize: 50,
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      kgCuaHang = rating;
                    });
                  },
                ),
              ],
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StarRow('Giá tiền:'),
                RatingBar.builder(
                  itemSize: 50,
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      giaTien = rating;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StarRow('Thái độ phục vụ:'),
                RatingBar.builder(
                  itemSize: 50,
                  initialRating: 1,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      tdPhucVu = rating;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orangeAccent,
          fixedSize: Size(200,80)
        ),
        onPressed: () {_danhGiaPage(context, widget.nameBt);},
        //onPressed: ()=> print(clSanPham),
        child: Text('Tiếp Tục',
        style: TextStyle(fontSize: 25),),

      ),
    );
  }

}

