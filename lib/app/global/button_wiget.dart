import 'package:app_covid/app/global/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:nice_buttons/nice_buttons.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatefulWidget {
  ButtonWidget({
    super.key, 
    required this.text, 
    required this.onPressed,
    this.icon, 
    required this.textColor,
    this.width,
    this.disabled = false,
  });
  final String text;
  VoidCallback onPressed;
  final IconData? icon;
  final Color textColor;
  final double? width;
  bool disabled;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      width: widget.width,
      height: 80,
      child: NiceButtons(
        progress: true,
        progressColor: CustomColors.finalGradient,
        progressSize: 10,
        disabled: widget.disabled,
        onTap: (finish){
          Future.delayed(
            const Duration(milliseconds: 2000), (){
              widget.onPressed();           
              finish();
            },
          );
        }, 
        stretch: true,
        borderColor: widget.disabled ? CustomColors.borderButtonDisabled : CustomColors.bottomButtonEnter,
        startColor: widget.disabled ? CustomColors.buttonDisabled : CustomColors.buttonEnter,
        endColor: widget.disabled ? CustomColors.buttonDisabled : CustomColors.buttonEnter,
        borderRadius: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 5,),
            Text(
              widget.text,
              style: TextStyle(
                fontFamily: "Sophisto",
                color: widget.disabled ? CustomColors.textButtonDisabled : widget.textColor,
                fontWeight: FontWeight.normal,
                fontSize: 20
              ),
              textAlign: TextAlign.center,
            ),
            Visibility(
              visible: widget.icon != null,
              child: 
              Icon(
                widget.icon, color: const Color(0xff296880), size: 48,
              )
            )
          ],
        )
      ),
    );
  }

}


