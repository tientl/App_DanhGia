
import 'package:cuoi_ki_moblie/Customize/CustomizeButton.dart';
import 'package:cuoi_ki_moblie/Pages/ThanksPage.dart';
import 'package:cuoi_ki_moblie/service/auth_base.dart';
import 'package:cuoi_ki_moblie/service/database.dart';
import 'package:cuoi_ki_moblie/sign_in/Email_sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key, required this.auth, required this.onSignOut}) : super(key:key);
  final AuthBase auth;
  final VoidCallback onSignOut;

  void _SignInWithEmail(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (Context)=>EmailSignInPage()));
  }

  Future<User?> _SignInGoogle(BuildContext context) async{
    try{
      User? user = await auth.SignInGoogle();
      //await DatabaseService(uid:user!.uid).updatedData('sd',FirebaseAuth.instance.currentUser!.email.toString() , 'feedback');
      if(user != null){
        Navigator.of(context).push(MaterialPageRoute(builder: (Context)=>ThanksPage()));
      }
    }
    catch(e)
    {
      print(e.toString());
    };
  }

  Future<UserCredential?> _SignInFB() async{
    try{
      UserCredential userCredential = await auth.signInWithFacebook();
    }
    catch(e)
    {
      print(e.toString());
    };
  }
  Future<User?> _SignInAnonymously() async {
    try{
      // UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
      // onSignIn(userCredential.user!);
      User? user = await auth.SignInAnonymously();
      //onSignIn(user!);
    }
    catch(e){
      print(e.toString());
    };
  }
  Future<void> signOut() async {
    try {
      print('test1');
      //await FirebaseAuth.instance.signOut();
      await auth.SignOut();
      onSignOut();
    }
    catch (e) {
      print(e.toString());
    }
  }

  void _homePage(BuildContext context){
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            actions: [
              ElevatedButton(
                onPressed: (){_homePage(context);},
                child: Icon(Icons.home_rounded,size: 70,),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                ),

              )
            ],
            title: Text("ĐĂNG NHẬP",
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            centerTitle: true,
            backgroundColor: Colors.deepOrange,
            toolbarHeight: 150,

          ),
          body: Container(
            color: Colors.grey.shade100,
            padding: EdgeInsets.only(left: 215,right: 215),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                CustomizeElevatedButton(
                  widget: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('images/google-logo.png'),
                      Text(
                        'Sign in with Google',
                        style:
                        TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 25),
                      ),
                      Opacity(child: Image.asset('images/facebook-logo.png'), opacity: 0),
                    ],
                  ),
                  backgroundColor: Colors.white,
                  onPressed: (){
                    _SignInGoogle(context);
                  },
                ),
                SizedBox(height: 20,),
                CustomizeElevatedButton(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('images/facebook-logo.png'),
                      Text(
                        'Sign in with Facebook',
                        style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
                      ),
                      Opacity(child: Image.asset('images/facebook-logo.png'), opacity: 0),
                    ],
                  ),
                  backgroundColor: Colors.indigo,
                  onPressed: () {
                    _SignInFB();
                  },
                ),
                SizedBox(height: 20,),
                CustomizeElevatedButton(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('images/email-logo.png'),
                      Text(
                        'Sign in with Email',
                        style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
                      ),
                      Opacity(child: Image.asset('images/facebook-logo.png'), opacity: 0),
                    ],
                  ),
                  backgroundColor: Colors.orange,
                  onPressed: (){
                    _SignInWithEmail(context);
                  },
                ),
                SizedBox(height: 20,),
                Text(
                  'Or',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    //color: Colors.orange,
                  ),),
                SizedBox(height: 20,),
                CustomizeElevatedButton(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('images/anonymous-logo.png'),
                      Text(
                        'Sign in with Anoymous',
                        style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25),
                      ),
                      Opacity(child: Image.asset('images/facebook-logo.png'), opacity: 0),
                    ],
                  ),
                  backgroundColor: Colors.greenAccent,
                  onPressed: (){
                    //HomePage(onSignOut: () {  }, auth:  ,);
                    _SignInAnonymously();
                  },
                ),
                SizedBox(height: 10,),



              ],
            ),
          ),
        ));
  }

}
