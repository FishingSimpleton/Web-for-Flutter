import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'HeaderBody.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    Key key,
  }) : super(key: key);

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
            child: HeaderBody(),
          ),
        );
      },
    );
  }
}
//
// class HeaderMobileView extends StatelessWidget {
//   const HeaderMobileView({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//
//     return Container(
//       height: height ,
//       width: width,
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       child: Column(
//         children: [
//           Spacer(),
//           HeaderBody(),
//         ],
//       ),
//     );
//   }
// }
