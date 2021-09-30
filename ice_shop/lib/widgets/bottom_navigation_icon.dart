import 'package:flutter/material.dart';
import 'package:ice_shop/widgets/costom_text.dart';


class BottomNavIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function onTap;

  const BottomNavIcon({required this.image,required this.name,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap:() => onTap,
        child: Column(
          children: <Widget>[
            Image.asset("images/$image",width: 20,height: 20,),
            SizedBox(height: 2,),
            CustomText(text: name,)
          ],
        ),
      ),
    );
  }
}