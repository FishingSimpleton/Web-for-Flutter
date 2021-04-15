import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../utils/api.dart';

class RegisterBody extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<RegisterBody> {
  @override
  Widget build(BuildContext context) {
    TextEditingController actController = TextEditingController();
    TextEditingController pwdController = TextEditingController();
    TextEditingController confrimpwdController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        //border: new Border.all(width: 2.0, color: Colors.red),
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
        image: DecorationImage(
            image: new AssetImage("assets/images/book4.jpg"), fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth: 500, minWidth: 50, minHeight: 100),
                    child: Text("Sign up",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        ))),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500, minWidth: 50),
                  child: TextField(
                    style:
                    TextStyle(fontSize: 30, color: Colors.blueAccent),
                    textAlign: TextAlign.center,
                    autofocus: true,
                    controller: actController,
                    decoration: InputDecoration(
                        labelText: "Username/Email",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        prefixIcon: Icon(Icons.person)),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500, minWidth: 50),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 30, color: Colors.blueAccent),
                    controller: pwdController,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle:
                        TextStyle(color: Colors.white, fontSize: 20),
                        prefixIcon: Icon(Icons.lock)),
                    obscureText: true,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500, minWidth: 50),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style:
                    TextStyle(fontSize: 30, color: Colors.blueAccent),
                    controller: confrimpwdController,
                    decoration: InputDecoration(
                        labelText: "ConfrimPassword",
                        labelStyle:
                        TextStyle(color: Colors.white, fontSize: 20),
                        prefixIcon: Icon(Icons.lock_open)),
                    obscureText: true,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500, minWidth: 50),
                  child: TextField(
                    style:
                    TextStyle(fontSize: 30, color: Colors.blueAccent),
                    textAlign: TextAlign.center,
                    autofocus: true,
                    controller: phoneController,
                    decoration: InputDecoration(
                        labelText: "Phone",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        prefixIcon: Icon(Icons.phone)),
                  ),
                ),

                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  color: Colors.redAccent,
                  onPressed: () {
                    print(actController.text);
                    print(pwdController.text);
                    _onRegister(actController.text, pwdController.text,confrimpwdController.text,phoneController.text, context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 200,
                    ),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500, minWidth: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I already have an account,",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 17,
                            horizontal: 15,
                          ),
                          child: Text(
                            'Sign in！',
                            style: TextStyle(
                              //decoration: TextDecoration.underline,
                              fontSize: 20,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

void _onRegister(String account, String password, String confrimpassword, String phone ,context) {
  if (account.isEmpty&&password.isEmpty&&phone.isEmpty) {

    BotToast.showText(text: "信息不可为空");
    return;
  }
  if (account.isEmpty) {

    BotToast.showText(text: "账号不可为空");
    return;
  }
  if (password.isEmpty) {
    BotToast.showText(text: "密码不可为空");

    return;
  }
  if (phone.isEmpty) {

      BotToast.showText(text: "手机号不可为空");
      return;
  }
  if(password!=confrimpassword)
  {
      BotToast.showText(text: "俩次输入密码不一致");
      return;
  }

  //Loading.show(context);

  Api().register(account, password,phone).then((value) {
    //print("返回的数据是:${value}");

    BotToast.showText(text: value.data['msg']);
    if (value.data['flag'] == 1) {
      Navigator.popAndPushNamed(context, "/login");
    } else {

      //LocalSave().save(phone,pwd,value.data['user']['name'],value.data['user']['manage']);

    }
  }).catchError((error) {
    //Loading.dismiss(context);
    BotToast.showText(text: "出现错误!");
  });
}

void _showMessageDialog(String message, context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text('注意'),
        content: new Text(message),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("确定"))
        ],
      );
    },
  );
}
