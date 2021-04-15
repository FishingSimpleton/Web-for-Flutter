import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:web_flutter/header/HeaderView.dart';
import 'package:web_flutter/login/LoginView.dart';

import 'DataView.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:  BoxDecoration(
        color: Colors.grey,
        //border: new Border.all(width: 2.0, color: Colors.red),
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          image:  DecorationImage(
                image: new  AssetImage("assets/images/person.jpg"),
                fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent, //把scaffold的背景色改成透明
            appBar: AppBar(
              backgroundColor: Colors.transparent, //把appbar的背景色改成透明
              // elevation: 0,//appbar的阴影
              title: Text("Welcome to Library management system"),
            ),
            drawer: Drawer(

              child: ListView(

                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[

                  DrawerHeader(
                    child: Text('Drawer Header'),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text('修改密码'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text('退出登录'),
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          new MaterialPageRoute(builder: (context) => new HeaderView()),
                              (route) => route == null);

                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              ),
            ),

            body:Row(children: [Container(
                width: 300,
                child:ListView(
                    children: [
                      ExpansionTile(title: Text("采购管理",style: TextStyle(fontSize: 22, color: Colors.black87,)), leading: Icon(Icons.add_shopping_cart),
                        children: [
                          ListTile(title: Text("采购入库管理",style: TextStyle(fontSize: 22, color: Colors.black87,)),
                          leading: Icon(Icons.shopping_cart),
                          onTap: (){
                            BotToast.showText(text: "采购入库管理");
                          },),
                          ListTile(title: Text("采购退货管理",style: TextStyle(fontSize: 22, color: Colors.black87,)),
                            leading: Icon(Icons.shopping_cart_outlined),
                            onTap: (){
                              BotToast.showText(text: "采购退货管理");
                            },),],),
                      ExpansionTile(title: Text("库存管理",style: TextStyle(fontSize: 22, color: Colors.black87,)), leading: Icon(Icons.food_bank_sharp),children: [
                        ListTile(title: Text("库存查询",style: TextStyle(fontSize: 22, color: Colors.black87,)),
                          leading: Icon(Icons.find_in_page_rounded),
                          onTap: (){
                            BotToast.showText(text: "库存查询");
                          },),
                        ]),
                      ExpansionTile(title: Text("销售管理",style: TextStyle(fontSize: 22, color: Colors.black87,)),leading: Icon(Icons.money),
                          children: [
                        ListTile(title: Text("销售出库管理",style: TextStyle(fontSize: 22, color: Colors.black87,)),
                          leading: Icon(Icons.attach_money),
                          onTap: (){
                            BotToast.showText(text: "销售出库管理");
                          },),
                        ListTile(title: Text("销售退货管理",style: TextStyle(fontSize: 22, color: Colors.black87,)),
                          leading: Icon(Icons.money_off_csred_outlined),
                          onTap: (){
                            BotToast.showText(text: "销售退货管理");
                          },),]),
                      ExpansionTile(title: Text("查询统计",style: TextStyle(fontSize: 22, color: Colors.black87,)),leading: Icon(Icons.screen_search_desktop), children: [
                        ListTile(title: Text("导出商品报表",style: TextStyle(fontSize: 22, color: Colors.black87,)),
                          leading: Icon(Icons.search),
                          onTap: (){
                            BotToast.showText(text: "导出商品报表");
                          },),
                        ListTile(title: Text("导出采购报表",style: TextStyle(fontSize: 22, color: Colors.black87,)),
                          leading: Icon(Icons.search),
                          onTap: (){
                            BotToast.showText(text: "导出采购报表");
                          },),
                        ListTile(title: Text("导出年采购报表",style: TextStyle(fontSize: 22, color: Colors.black87,)),
                          leading: Icon(Icons.search),
                          onTap: (){
                            BotToast.showText(text: "导出年采购报表");
                          },),
                      ]),
                      ExpansionTile(title: Text("资料管理",style: TextStyle(fontSize: 22, color: Colors.black87,)),leading: Icon(Icons.library_books),
                        children: [
                          ListTile(title: Text("书籍资料管理",style: TextStyle(fontSize: 22, color: Colors.black87,)),
                            leading: Icon(Icons.menu_book_outlined),
                            onTap: (){
                              BotToast.showText(text: "书籍资料管理");
                            },),
                          ListTile(title: Text("供应商资料管理",style: TextStyle(fontSize: 22, color: Colors.black87,)),
                            leading: Icon(Icons.recent_actors),
                            onTap: (){
                              BotToast.showText(text: "供应商资料管理");
                            },),
                          ListTile(title: Text("客户资料管理",style: TextStyle(fontSize: 22, color: Colors.black87,)),
                            leading: Icon(Icons.recent_actors_outlined),
                            onTap: (){
                              BotToast.showText(text: "客户资料管理");
                            },),
                        ],),
                      ExpansionTile(title: Text("系统管理",style: TextStyle(fontSize: 22, color: Colors.black87,)),leading: Icon(Icons.admin_panel_settings_outlined),children: [
                      ListTile(title: Text("用户管理",style: TextStyle(fontSize: 22, color: Colors.black87,)),
                        leading: Icon(Icons.account_circle_outlined),
                        onTap: (){
                          BotToast.showText(text: "用户管理");
                      },),
                        ],),
                    ]
                ),
            ),
            Container(
                width: 2000,

                child:Expanded(child:DataView(),)

            )

            ]

            )
        )
        // child: Drawer(

        //     child: MediaQuery.removePadding(
        //       context: context,
        //       //移除抽屉菜单顶部默认留白
        //       removeTop: true,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: <Widget>[
        //           Padding(
        //             padding: const EdgeInsets.only(top: 38.0),
        //             child: Row(
        //               children: <Widget>[
        //                 Padding(
        //                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //                   child: ClipOval(
        //                     child: Image.asset(
        //                       "assets/images/backgroud1.jpg",
        //                       width: 80,
        //                     ),
        //                   ),
        //                 ),
        //                 Text(
        //                   "图书供销存系统",
        //                   style: TextStyle(fontWeight: FontWeight.bold),
        //                 )
        //               ],
        //             ),
        //           ),
        //           Expanded(
        //             child: ListView(
        //               children: <Widget>[
        //                 ListTile(
        //                   leading: const Icon(Icons.add),
        //                   title: const Text('采购管理'),
        //                   onTap: () => Navigator.pushNamed(context, "/login"),
        //                 ),
        //                 ListTile(
        //                   leading: const Icon(Icons.settings),
        //                   title: const Text('库存管理'),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //     ))
    );
  }
}
