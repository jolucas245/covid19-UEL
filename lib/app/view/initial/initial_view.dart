import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../global/button_wiget.dart';
import '../../global/custom_colors.dart';
import '../../global/images_file.dart';
import '../../global/semi_circle_widget.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InitialView extends StatelessWidget {

  const InitialView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [CustomColors.initialGradient, CustomColors.finalGradient],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
          ),
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle.light.copyWith(
                      statusBarColor: CustomColors.initialGradient
                    ),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ImagesFiles.logoImage.animate().slideY(),
                          const SizedBox(height: 100,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 350,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.19, 
                                  child: Center(child: ImagesFiles.bubble)
                                ).animate().fadeIn(duration: 1.seconds).then().shake(duration: 500.ms),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ButtonWidget(
                                    onPressed: () => context.go("/lembre"),
                                    text: "ENTRAR",
                                    icon: Icons.arrow_right,
                                    textColor: CustomColors.initialGradient,
                                    width: 150,
                                  ),
                                ),                      
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: ImagesFiles.penguin
                                  ).animate().slideX(begin: 10, end: 0, duration: 500.ms, curve: Curves.bounceIn).then().scale(begin: const Offset(5, 5), end: const Offset(1, 1))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SemiCircleWidget().animate().slideY(begin: 5, end: 0)
              )
            ],
          ),
        ],
      ),
    );
  }


  

}