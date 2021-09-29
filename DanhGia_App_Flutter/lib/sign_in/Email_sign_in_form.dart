//@dart=2.9
import 'package:cuoi_ki_moblie/Customize/show_alert_Dialog.dart';
import 'package:cuoi_ki_moblie/Pages/listFeedback.dart';
import 'package:cuoi_ki_moblie/service/auth_base.dart';
import 'package:cuoi_ki_moblie/sign_in/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


enum EmailSignInFormType{signIn, register}

class EmailSignInForm extends StatefulWidget with EmailAndPasswordValidator {
  EmailSignInForm ({@required this.auth});
  final AuthBase auth;

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm>  {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  bool _submited = false;
  EmailSignInFormType _fromType = EmailSignInFormType.signIn;

  void _emailEditingComlete(){
    print('Test Focus'+ _email);
    FocusScope.of(context).requestFocus(_passwordFocus);
  }
  Future<void> _submit() async {
    setState(() {
      _submited = true;
    });
    try{
      if(_fromType == EmailSignInFormType.signIn){
        await widget.auth.signInWithEmailAndPassword(_email,_password);
      }
      else{
        await widget.auth.createUserWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FeedbackPage()));
    }
    catch(e){
      await showAlertDialog(
          context,
          title: 'Error',
          content: e.toString(),
          defaultActionText: 'OK');
    }

  }
  void _toggleFormType(){
    setState(() {
      _fromType = _fromType == EmailSignInFormType.signIn?EmailSignInFormType.register:EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChidren() {
    final primaryText = _fromType == EmailSignInFormType.signIn? 'Đăng nhập': 'Tạo tài khoản';
    //final secondText = _fromType == EmailSignInFormType.signIn? 'Bạn chưa có tài khoản? Đăng kí Ngay!': 'Bạn đã có tài khoản? Đăng nhập ngay!';
    bool submitEnable = widget.emailValidator.isValid(_email)&& widget.passwordValidator.isValid(_password);
    return [
      _buildEmailTextFied(),
      SizedBox(height: 10.0,),
      _buildPassTextFied(),
      SizedBox(height: 20.0,),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromHeight(50),
          ),
          onPressed:submitEnable? _submit:null,
          child: Text(primaryText,
          style: TextStyle(fontSize: 20),
          )
      ),
      SizedBox(height: 10.0,),
      // TextButton(
      //     onPressed:_toggleFormType,
      //     child: Text(secondText,
      //       style: TextStyle(fontSize: 20),))

    ];
  }

  TextField _buildPassTextFied() {
    bool passValid = !widget.passwordValidator.isValid(_password) && _submited;
    return TextField(
      controller: _passwordController,
      obscureText: true,
      style: TextStyle(fontSize: 22),
      decoration: InputDecoration(
        labelText: 'Mật khẩu',
        errorText: passValid? widget.invalidPasswordErrorText : null,
        labelStyle: TextStyle(fontSize: 25),
      ),
      textInputAction: TextInputAction.done,
      focusNode: _passwordFocus,
      onChanged: _updateSate,

    );
  }

  TextField _buildEmailTextFied() {
    bool emailValid = !widget.emailValidator.isValid(_email)&& _submited;
    return TextField(
      style: TextStyle(fontSize: 22),
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email', hintText: 'test@test.com',
        labelStyle: TextStyle(fontSize: 25),
        errorText:emailValid? widget.invalidEmailErrorText : null,
      ),
      textInputAction: TextInputAction.next,
      onEditingComplete: _emailEditingComlete,
      onChanged:_updateSate,
    );
  }

  @override
  Widget build(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildChidren(),
    );

  }
  void _updateSate(String value){
    setState((){
      print(_email);
    });
  }
}
