import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class SildeView extends StatelessWidget {
  GlobalKey<SliderMenuContainerState> _key =
  new GlobalKey<SliderMenuContainerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          //border: new Border.all(width: 2.0, color: Colors.red),
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          image: DecorationImage(
              image: new AssetImage("assets/images/dune.jpg"), fit: BoxFit.cover),
        ),
          child: SliderMenuContainer(
              appBarColor: Colors.transparent,
              key: _key,
              sliderMenuOpenSize: 100,
              title: Text(
                "",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              sliderMenu: Container(
                color:Colors.blue,
                child: ListView(
                  children: [
                    ExpansionTile(title: Text("aaa")),
                    ExpansionTile(title: Text("aaa")),
                    ExpansionTile(title: Text("aaa")),
                    ExpansionTile(title: Text("aaa")),

                    ExpansionTile(title: Text("bbb"))
                  ],
                ),


              ),
              sliderMain: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  //border: new Border.all(width: 2.0, color: Colors.red),
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),

                ),
                child: Center(child:
                TextButton(
                  child: Text("aaa"),
                    onPressed:(){
                    BotToast.showText(text: "text");
                    }
                ),

                ),
              )),
      ),
    );




  }
}
