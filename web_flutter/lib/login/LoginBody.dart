import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../utils/api.dart';

class LoginBody extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    TextEditingController actController = TextEditingController();
    TextEditingController pwdController = TextEditingController();
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
                    child: Text("Sign in",
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/reset");
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 17,
                            horizontal: 15,
                          ),
                          child: Text(
                            'Forgot Password',
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
                    _onLogin(actController.text, pwdController.text, context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 200,
                    ),
                    child: Text(
                      'Login',
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
                        "I dont have an account,",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 17,
                            horizontal: 15,
                          ),
                          child: Text(
                            'Sign up！',
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

void _onLogin(String account, String passwword, context) {
  if (account.isEmpty&&passwword.isEmpty) {

    BotToast.showText(text: "账号、密码不可为空");
    return;
  }
  if (account.isEmpty) {

    BotToast.showText(text: "账号不可为空");
    return;
  }
  if (passwword.isEmpty) {
    BotToast.showText(text: "密码不可为空");

    return;
  }

  //Loading.show(context);

  Api().login(account, passwword).then((value) {
    //print("返回的数据是:${value}");

    BotToast.showText(text: value.data['msg']);
    if (value.data['flag'] == 1) {
      Navigator.popAndPushNamed(context, "/main");
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
