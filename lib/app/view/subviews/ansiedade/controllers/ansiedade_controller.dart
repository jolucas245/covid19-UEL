import 'package:flutter/material.dart';

import '../../../../global/card_info.dart';
import '../../../../global/custom_colors.dart';
import '../strings/strings.dart';

class AnsiedadeController{
  BuildContext? context;
  Function? refresh;
  GlobalKey<ScaffoldState> key =  GlobalKey<ScaffoldState>();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
  }

  final PageController? pageController = PageController(initialPage: 0);
  final List<Widget> pagesIdentify = [
    SizedBox(
      height: 500,
      child: CardInfo(
        text: StringsAnsiedade.identifyFirst, 
        color: CustomColors.ansiedadeAppbarColor,
        boldWords: StringsAnsiedade.boldWordsIdentify
      ),
    ),
    CardInfo(
      text: StringsAnsiedade.identifySecond, 
      color: CustomColors.ansiedadeAppbarColor,
      boldWords: StringsAnsiedade.boldWordsIdentify
    ),
  ];

  final List<Widget> pagesToLead = [
    CardInfo(
      text: StringsAnsiedade.toLeadFirst, 
      color: CustomColors.ansiedadeAppbarColor,
      boldWords: StringsAnsiedade.boldWordsToLead
    ),
    CardInfo(
      text: StringsAnsiedade.toLeadSecond, 
      color: CustomColors.ansiedadeAppbarColor,
      boldWords: StringsAnsiedade.boldWordsToLead
    ),
    CardInfo(
      text: StringsAnsiedade.toLeadThird, 
      color: CustomColors.ansiedadeAppbarColor,
      boldWords: StringsAnsiedade.boldWordsToLead
    ),
  ];
  
  final List<Widget> pagesStrategyJob = [
    CardInfo(
      text: StringsAnsiedade.strategyJobFirst, 
      color: CustomColors.ansiedadeAppbarColor,
      boldWords: StringsAnsiedade.boldWordsStrategyJob
    ),
    SizedBox(
      height: 469,
      child: CardInfo(
        text: StringsAnsiedade.strategyJobSecond, 
        color: CustomColors.ansiedadeAppbarColor,
        boldWords: StringsAnsiedade.boldWordsStrategyJob
      ),
    ),
    CardInfo(
      text: StringsAnsiedade.strategyJobThird, 
      color: CustomColors.ansiedadeAppbarColor,
      boldWords: StringsAnsiedade.boldWordsStrategyJob
    ),
  ];

  final currentPage = ValueNotifier<int>(0);
  bool isButtonDisabled = true;

}