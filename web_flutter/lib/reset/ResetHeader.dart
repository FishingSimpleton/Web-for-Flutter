import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:web_flutter/utils/api.dart';
import 'package:web_flutter/utils/localsave.dart';



class ResetHeader extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ResetHeader> {
  @override
  Widget build(BuildContext context) {
    TextEditingController actController = TextEditingController();
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
                    child: Text("Reset Password",
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
                        labelText: "Your Username/Email",
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
                    style:
                    TextStyle(fontSize: 30, color: Colors.blueAccent),
                    textAlign: TextAlign.center,
                    autofocus: true,
                    controller: phoneController,
                    decoration: InputDecoration(
                        labelText: "Your Phone",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        prefixIcon: Icon(Icons.phone)),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500, minWidth: 50),
                  child: Text("   "),
                ),
                // ConstrainedBox(
                //   constraints: BoxConstraints(maxWidth: 500, minWidth: 50),
                //   child: TextField(
                //     textAlign: TextAlign.center,
                //     style:
                //     TextStyle(fontSize: 30, color: Colors.blueAccent),
                //     controller: pwdController,
                //     decoration: InputDecoration(
                //         labelText: "Password",
                //         labelStyle:
                //         TextStyle(color: Colors.white, fontSize: 20),
                //         prefixIcon: Icon(Icons.lock)),
                //     obscureText: true,
                //   ),
                // ),
                // ConstrainedBox(
                //   constraints: BoxConstraints(maxWidth: 500, minWidth: 50),
                //   child: TextField(
                //     textAlign: TextAlign.center,
                //     style:
                //     TextStyle(fontSize: 30, color: Colors.blueAccent),
                //     controller: confrimpwdController,
                //     decoration: InputDecoration(
                //         labelText: "ConfrimPassword",
                //         labelStyle:
                //         TextStyle(color: Colors.white, fontSize: 20),
                //         prefixIcon: Icon(Icons.lock_open)),
                //     obscureText: true,
                //   ),
                // ),


                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  color: Colors.redAccent,
                  onPressed: () {
                    //print(actController.text);

                    _onReset(actController.text, phoneController.text, context);
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

void _onReset(String account, String phone ,context) {
  if (account.isEmpty&&phone.isEmpty) {

    BotToast.showText(text: "信息不可为空");
    return;
  }
  if (account.isEmpty) {

    BotToast.showText(text: "账号不可为空");
    return;
  }

  if (phone.isEmpty) {

    BotToast.showText(text: "手机号不可为空");
    return;
  }


  //Loading.show(context);

  Api().searchUser(account).then((value) {
    print(value.data['msg']);
    //print("返回的数据是:${value}");
    print(value.data['user']['phone']);
    if (value.data['flag'] == 1) {
      if(value.data['user']['phone']==phone) {
        print("1");
        Global.Account=value.data['user']['account'];
        Navigator.popAndPushNamed(context, "/resetBody");
      }
      else
        BotToast.showText(text: "账户信息不匹配");
    }
    else {BotToast.showText(text: "系统中不存在该用户");

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
