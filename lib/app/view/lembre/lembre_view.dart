import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../global/menu_global.dart';
import '../../global/appbar_global.dart';
import '../../global/background_container.dart';
import '../../global/button_wiget.dart';
import '../../global/custom_colors.dart';
import '../../global/images_file.dart';
import 'strings/strings.dart';

class LembreView extends StatelessWidget {
  const LembreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGlobal(
        safeColor: CustomColors.autocuidadoAppbarColor,
        color: CustomColors.autocuidadoAppbarColor,
        text: "Lembre-se",
        drawer: true,
      ),
      drawerEnableOpenDragGesture: false,
      drawer: MenuGlobal(
        colorHeader: CustomColors.autocuidadoAppbarColor,
        colorBackgroundDrawer: CustomColors.autocuidadoBackgroundColor,
      ),
      body: Stack(
        children: [
          const BackgroundContainer(),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    StringsLembre.unique,
                    style: const TextStyle(
                      fontFamily: "Arial",
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ImagesFiles.bubbleLembre
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: ButtonWidget(
                              text: "Ansiedade", 
                              onPressed: () => GoRouter.of(context).push("/ansiedadewhat"), 
                              textColor: Colors.white
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: ButtonWidget(
                              text: "Estresse", 
                              onPressed: () => context.replace("/estresse"), 
                              textColor: Colors.white
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: ButtonWidget(
                              text: "Luto", 
                              onPressed: () => context.push("/estresse"), 
                              textColor: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ImagesFiles.penguin
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}