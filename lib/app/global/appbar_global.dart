import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class AppBarGlobal extends StatelessWidget implements PreferredSizeWidget {
  Color color;
  String text;
  Color safeColor;
  VoidCallback? onTap;
  bool drawer; // Adicionando o Drawer opcional

  AppBarGlobal({
    Key? key, // Correção: super.key deve ser substituído por key
    required this.color,
    required this.text,
    required this.safeColor,
    this.onTap,
    this.drawer = false, // Adicionando o Drawer opcional no construtor
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(statusBarColor: safeColor),
      child: SafeArea(
        child: Container(
          color: color,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Visibility(
                visible: onTap != null,
                child: IconButton(
                  onPressed: onTap,
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
              Visibility(
                visible: drawer,
                child: IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(Icons.menu, color: Colors.white),
                ),
              ),
              const SizedBox(width: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontFamily: "Sophisto",
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
