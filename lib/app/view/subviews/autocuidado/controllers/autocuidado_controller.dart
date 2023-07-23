import 'package:flutter/material.dart';

import '../../../../global/card_info.dart';
import '../../../../global/custom_colors.dart';
import '../strings/strings.dart';

class AutocuidadoController{
  BuildContext? context;
  Function? refresh;
  GlobalKey<ScaffoldState> key =  GlobalKey<ScaffoldState>();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
  }

  final PageController? pageController = PageController(initialPage: 0);
  final List<Widget> pages = [
    CardInfo(
      text: StringsAutocuidado.first, 
      color: CustomColors.autocuidadoAppbarColor,
      boldWords: const [],
    ),
    CardInfo(
      text: StringsAutocuidado.second, 
      color: CustomColors.autocuidadoAppbarColor,
      boldWords: const [],
    ),
    CardInfo(
      text: StringsAutocuidado.third, 
      color: CustomColors.autocuidadoAppbarColor,
      boldWords: const [],
    ),
    CardInfo(
      text: StringsAutocuidado.fourth, 
      color: CustomColors.autocuidadoAppbarColor,
      boldWords: const [],
    ),
  ];

  final currentPage = ValueNotifier<int>(0);
  bool isButtonDisabled = true;

}