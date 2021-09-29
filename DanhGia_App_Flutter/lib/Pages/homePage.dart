import 'package:cuoi_ki_moblie/Pages/danhgia_page.dart';
import 'package:cuoi_ki_moblie/Pages/rateStarPage.dart';
import 'package:cuoi_ki_moblie/Pages/signInPage.dart';
import 'package:cuoi_ki_moblie/service/auth.dart';
import 'package:cuoi_ki_moblie/sign_in/Email_sign_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key, auth}) : super(key: key);

  //final String nameBt;

  void _RateStarPage(BuildContext context,String nameBt){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RateStarPage(nameBt: nameBt,)));
  }
  void _SignInWithEmail(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (Context)=>EmailSignInPage()));
  }
  void _signInPage(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignInPage( auth: Auth(), onSignOut: () {  },)));
  }
  void _danhGiaPage(BuildContext context,String nameBt){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DanhGiaPage(nameBt:nameBt, )));

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: Colors.orangeAccent,
          centerTitle: true,
          title: Text("ĐÁNH GIÁ",
              style: TextStyle(fontSize: 50,
                  color: Colors.blueGrey
                //backgroundColor: Colors.red,
              )),

        ),
        body: Center(
            child:Column(
                children:[
                  SizedBox(height: 100,),
                  Text("QÚY KHÁCH VUI LÒNG ĐÁNH GIÁ CHẤT LƯỢNG DỊCH VỤ CỦA CHÚNG TÔI:",
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.all(50),
                    //padding: EdgeInsets.only(left: 80,right:30 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            style:ButtonStyle( backgroundColor: MaterialStateProperty.all(Colors.white)),
                            onPressed:(){_danhGiaPage(context,'Yêu Thích');},
                            child:Column(
                              mainAxisSize:MainAxisSize.min,
                              children: [
                                Image.asset("images/iconLove.gif",width: 220,height: 220,),
                                Text("Yêu Thích",
                                  style: TextStyle(
                                    color:Colors.black,
                                    fontSize: 30,
                                  ) ,
                                )
                              ],
                            )
                        ),
                        TextButton(
                            style:ButtonStyle( backgroundColor: MaterialStateProperty.all(Colors.white)),
                            onPressed:(){_danhGiaPage(context,'Hài Lòng');} ,
                            child:Column(
                              mainAxisSize:MainAxisSize.min,
                              children: [
                                Image.asset("images/iconHappy.gif",width: 220,height: 220,),
                                Text("Hài Lòng",
                                  style: TextStyle(
                                    color:Colors.black,
                                    fontSize: 30,
                                  ) ,
                                )
                              ],
                            )
                          //child: Image.asset("images/iconHappy.gif",width: 100,height: 100,),
                        ),
                        TextButton(
                            style:ButtonStyle( backgroundColor: MaterialStateProperty.all(Colors.white)),
                            onPressed:(){_danhGiaPage(context,'Tốt');},
                            child:Column(
                              mainAxisSize:MainAxisSize.min,
                              children: [
                                Image.asset("images/iconLike.gif",width: 220,height: 220,),
                                Text("Tốt",
                                  style: TextStyle(
                                    color:Colors.black,
                                    fontSize: 30,
                                  ) ,
                                )
                              ],
                            )
                          //child: Image.asset("images/iconHappy.gif",width: 100,height: 100,),
                        ),
                        TextButton(
                            style:ButtonStyle( backgroundColor: MaterialStateProperty.all(Colors.white)),
                            onPressed:()=>_RateStarPage(context,'Nhàm Chán') ,
                            child:Column(
                              mainAxisSize:MainAxisSize.min,
                              children: [
                                Image.asset("images/iconBored.gif",width: 220,height: 220,),
                                Text("Nhàm Chán",
                                  style: TextStyle(
                                    color:Colors.black,
                                    fontSize: 30,
                                  ) ,
                                )
                              ],
                            )
                          //child: Image.asset("images/iconHappy.gif",width: 100,height: 100,),
                        ),
                        TextButton(
                            style:ButtonStyle( backgroundColor: MaterialStateProperty.all(Colors.white)),
                            onPressed:()=>_RateStarPage(context,"Thất Vọng"),
                            child:Column(
                              mainAxisSize:MainAxisSize.min,
                              children: [
                                Image.asset("images/iconAngry.gif",width: 220,height: 220,),
                                Text("Thất Vọng",
                                  style: TextStyle(
                                    color:Colors.black,
                                    fontSize: 30,
                                  ) ,
                                )
                              ],
                            )
                          //child: Image.asset("images/iconHappy.gif",width: 100,height: 100,),
                        )
                      ],
                    ),
                  )
                ]
            )

        ),
          floatingActionButton: ElevatedButton(
            onPressed:()=>_SignInWithEmail(context) ,
            child: Text('ĐĂNG NHẬP',
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            style: ElevatedButton.styleFrom(
            fixedSize: Size.fromHeight(60),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                primary: Colors.orangeAccent,
            ),
      ),
      ),
    );
  }

}
