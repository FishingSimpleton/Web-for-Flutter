import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:web_flutter/register/RegisterBody.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ResponsiveBuilder(
      builder: (_, size) {
        //if (size.isMobile) return HeaderMobileView();
        return Container(
          height: height,
          width: width,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: RegisterBody(),
          ),
        );
      },
    );
  }
}
