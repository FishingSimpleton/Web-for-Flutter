import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_flutter/login/LoginView.dart';
import 'package:web_flutter/register/RegisterView.dart';

class HeaderBody extends StatelessWidget {
  //final bool isMobile;
  const HeaderBody({
    Key key,
    //this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        //border: new Border.all(width: 2.0, color: Colors.red),
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
        image: DecorationImage(
            image: new AssetImage("assets/images/book4.jpg"), fit: BoxFit.cover),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                        'Sign in',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 37),
                  //SizedBox(height: 2000),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterView();
                      }));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 17,
                        horizontal: 15,
                      ),
                      child: Text(
                        'Create my account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 37),
                ],
              ),
              Center(
                child:Column(children: [AutoSizeText(
                  'Welcome to Library Management System',
                  style: TextStyle(fontSize: 35,color: Colors.teal,fontFamily: GoogleFonts.montserrat().fontFamily),

                ),],)

              )
            ],
          )
        ],
      ),
    );
  }
}
