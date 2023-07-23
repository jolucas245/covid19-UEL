import 'package:app_covid/app/global/card_info.dart';
import 'package:app_covid/app/view/subviews/ansiedade/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../global/appbar_global.dart';
import '../../../global/button_wiget.dart';
import '../../../global/custom_colors.dart';
import '../../../global/images_file.dart';

class AnsiedadeStrategyNowView extends StatefulWidget {
  const AnsiedadeStrategyNowView({super.key});

  @override
  State<AnsiedadeStrategyNowView> createState() => _AnsiedadeToLeadViewState();
}

class _AnsiedadeToLeadViewState extends State<AnsiedadeStrategyNowView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGlobal(
        safeColor: CustomColors.ansiedadeAppbarColor,
        color: CustomColors.ansiedadeAppbarColor,
        text: "Ansiedade",
        onTap: () => context.pop(),
      ),
      backgroundColor: CustomColors.ansiedadeBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: ImagesFiles.bubbleAnsiedadeStrategyNow,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 60),
                  child: CardInfo(
                    text: StringsAnsiedade.strategyNowFirst, 
                    color: CustomColors.ansiedadeAppbarColor, 
                    boldWords: StringsAnsiedade.boldWordsStrategyNow
                  )
                ),
                const SizedBox(height: 20,),
                ButtonWidget(
                  text: "Qual o próximo passo ?", 
                  onPressed: ()=>context.push(""),
                  textColor: Colors.white,
                  width: 300,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:400.0),
              child: Align(
                alignment: Alignment.centerRight, 
                child: Transform.scale(
                  scaleX: -1,
                  child: ImagesFiles.penguinAnsiedade
                )
              ),
            ),
          ],
        ),
      ),
    );
  }

  void refresh(){
    setState(() {
      
    });
  }
}