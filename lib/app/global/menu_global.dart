import 'package:app_covid/app/global/custom_colors.dart';
import 'package:app_covid/app/global/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuGlobal extends StatelessWidget {
  
  final Color colorHeader;
  final Color colorBackgroundDrawer;
  const MenuGlobal({super.key, required this.colorHeader, required this.colorBackgroundDrawer});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20)
        ),
        child: Drawer(
          width: 280,
          backgroundColor: colorBackgroundDrawer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                child: DrawerHeader(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: colorHeader
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        child: IconButton(
                          padding: const EdgeInsets.all(0),
                          iconSize: 45,
                          onPressed: () => context.pop(), 
                          icon: const Icon(Icons.menu, color: Colors.white)
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const Text(
                        "Menu",
                        style: TextStyle(
                          fontFamily: "Sophisto",
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              ),
              tiles(
                imagePath: "assets/icons/my_fellings.png",
                title: StringsMenu.fellings
              ),
              tiles(
                imagePath: "assets/icons/mental_health.png",
                title: StringsMenu.mentalHealth
              ),
              tiles(
                imagePath: "assets/icons/comunication.png",
                title: StringsMenu.comunication
              ),
              tiles(
                imagePath: "assets/icons/interaction.png",
                title: StringsMenu.interaction
              ),
              tiles(
                imagePath: "assets/icons/job_relation.png",
                title: StringsMenu.jobRelation
              ),
              tiles(
                imagePath: "assets/icons/selfcare.png",
                title: StringsMenu.selfcare
              ),
              tiles(
                imagePath: "assets/icons/utilities.png",
                title: StringsMenu.utilities
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tiles({required String imagePath, required String title}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(imagePath, height: 30),
          ),
          SizedBox(width: 3,),
          Container(
            width: 200,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Text(
              title,
              style: TextStyle(
                color: CustomColors.autocuidadoAppbarColor,
                fontWeight: FontWeight.w200,
                fontFamily: "Sophisto",
                fontSize: 23
              ),
            ),
          )
        ],
      ),
    );
  }
}