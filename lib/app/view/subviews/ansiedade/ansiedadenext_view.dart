import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../global/appbar_global.dart';
import '../../../global/button_wiget.dart';
import '../../../global/custom_colors.dart';
import '../../../global/images_file.dart';

class AnsiedadeNextView extends StatefulWidget {

  const AnsiedadeNextView({ Key? key }) : super(key: key);

  @override
  State<AnsiedadeNextView> createState() => _AnsiedadeNextViewState();
}

class _AnsiedadeNextViewState extends State<AnsiedadeNextView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGlobal(
        safeColor: CustomColors.ansiedadeAppbarColor,
        color: CustomColors.ansiedadeAppbarColor,
        text: "Ansiedade",
        onTap: () => context.pop()
      ),
      backgroundColor: CustomColors.ansiedadeBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ImagesFiles.bubbleAnsiedadeNext_1
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ButtonWidget(
                    text: "Seguir o passo a passo", 
                    onPressed: ()=>context.push('/ansiedadestrategynow'), 
                    width: 200,
                    textColor: Colors.white
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ImagesFiles.bubbleAnsiedadeNext_2
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ButtonWidget(
                    text: "Seguir o passo a passo", 
                    onPressed: ()=>context.push('/ansiedadestrategyjob'), 
                    width: 200,
                    textColor: Colors.white
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ImagesFiles.penguinAnsiedadeBottom
            )
          ],
        ),
      ),
    );
  }
}