import 'package:flutter/material.dart';

abstract class ImagesFiles{
  double? scale;
  ImagesFiles({
    this.scale
  });

  static Image logoImage = Image.asset("assets/img/logo.png", scale: 3);
  static Image bubble = Image.asset("assets/img/bubble_initial.png");
  static Image penguin = Image.asset("assets/img/penguin.png", scale: 3,);
  static Image penguinAnsiedade = Image.asset("assets/img/penguin_ansiedade.png", scale: 3,);
  static Image penguinAnsiedadeBottom = Image.asset("assets/img/penguin_ansiedade_bottom.png", scale: 3,);
  static Image bubbleAutocuidado= Image.asset("assets/img/bubble_autocuidado.png", scale: 3,);
  static Image bubbleLembre= Image.asset("assets/img/bubble_lembre.png", scale: 3,);
  static Image bubbleAnsiedadeWhat = Image.asset("assets/img/bubble_ansiedade_what.png", scale: 3,);
  static Image bubbleAnsiedadeIdentify = Image.asset("assets/img/bubble_ansiedade_identify.png", scale: 3,);
  static Image bubbleAnsiedadeToLead = Image.asset("assets/img/bubble_ansiedade_tolead.png", scale: 3,);
  static Image bubbleAnsiedadeNext_1 = Image.asset("assets/img/bubble_ansiedade_next_1.png", scale: 3,);
  static Image bubbleAnsiedadeNext_2 = Image.asset("assets/img/bubble_ansiedade_next_2.png", scale: 3,);
  static Image bubbleAnsiedadeStrategyJob = Image.asset("assets/img/bubble_ansiedade_strategy_job.png", scale: 3,);
  static Image bubbleAnsiedadeStrategyNow = Image.asset("assets/img/bubble_ansiedade_strategy_now.png", scale: 3,);
  
}