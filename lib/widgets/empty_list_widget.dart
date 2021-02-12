import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Não há dados para esse usuário...',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            height: 260,
            child: SvgPicture.asset('assets/no_data.svg'),
          ),
        ],
      ),
    );
  }
}
