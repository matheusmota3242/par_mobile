import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ErrorContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: SvgPicture.asset(
                  'assets/erro.svg',
                  height: 180,
                ),
              ),
            ),
            Text(
              'Desculpe, ocorreu um erro.',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ]),
    );
    ;
  }
}
