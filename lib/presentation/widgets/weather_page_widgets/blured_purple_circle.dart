import 'package:flutter/cupertino.dart';

import '../../../ui/colors.dart';

class BluredPurpleCircle extends StatelessWidget{
  const BluredPurpleCircle({super.key});

  @override
  Widget build(BuildContext context){
    return  Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: UIColors.purple,
          ),
          width: 150,
          height: 150,
        );
  }
}