import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:web_flutter/utils/api.dart';
import 'package:web_flutter/utils/localsave.dart';



class ResetBody extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ResetBody> {
  @override
  Widget build(BuildContext context) {
    TextEditingController pwdController = TextEditingController();
    TextEditingController confrimpwdController = TextEditingController();
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
                        maxWidth: 1000, minWidth: 50, minHeight: 100),
                    child: Text("Input Your New Password ",
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        ))),

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


                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  color: Colors.redAccent,
                  onPressed: () {
                    //print(actController.text);

                    _Reset(pwdController.text, confrimpwdController.text, context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 200,
                    ),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          )),
    );
  }
}

void _Reset(String password, String confrimpassword ,context) {
  if (password.isEmpty&&confrimpassword.isEmpty) {

    BotToast.showText(text: "请输入新密码");
    return;
  }
  if (password.isEmpty) {

    BotToast.showText(text: "新密码不可为空");
    return;
  }

  if (confrimpassword.isEmpty) {

    BotToast.showText(text: "请再次确认新密码");
    return;
  }
  if(password!=confrimpassword)
  {
    BotToast.showText(text: "俩次输入密码不一致");
    return;
  }


  //Loading.show(context);
  print(Global.Account);
  Api().updateUser(Global.Account,password,'password').then((value) {
    print(value.data['flag']);
    //print("返回的数据是:${value}");
    if (value.data['flag'] == 1) {
      Navigator.popAndPushNamed(context, "/login");
      BotToast.showText(text: '修改密码成功！');
    }

    else {BotToast.showText(text: value.data['msg']);

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
