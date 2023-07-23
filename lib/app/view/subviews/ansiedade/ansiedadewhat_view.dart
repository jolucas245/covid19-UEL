import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../global/appbar_global.dart';
import '../../../global/button_wiget.dart';
import '../../../global/card_info.dart';
import '../../../global/custom_colors.dart';
import '../../../global/images_file.dart';
import 'strings/strings.dart';

class AnsiedadeWhatView extends StatefulWidget {

  const AnsiedadeWhatView({ Key? key }) : super(key: key);

  @override
  State<AnsiedadeWhatView> createState() => _AnsiedadeWhatViewState();
}

class _AnsiedadeWhatViewState extends State<AnsiedadeWhatView> {

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
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: CardInfo(
                      text: StringsAnsiedade.what, 
                      color: CustomColors.ansiedadeAppbarColor,
                      boldWords: StringsAnsiedade.boldWordsIdentify,                
                    ),
                  ),
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 30), child: ImagesFiles.penguinAnsiedade),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(width: 150, child: ImagesFiles.bubbleAnsiedadeWhat),
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 20,),
            ButtonWidget(
              text: "Como identificar", 
              onPressed: () => GoRouter.of(context).push("/ansiedadeidentify"),
              textColor: Colors.white,
              width: 300,
              disabled: false
            )
          ],
        ),
      ),
    );
  }
}