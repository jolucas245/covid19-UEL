import 'package:flutter/material.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';

// ignore: must_be_immutable
class CardInfo extends StatelessWidget {

  ScrollController controller = ScrollController();

  String text;
  Color color;
  List<String> boldWords;

  CardInfo({super.key, required this.text, required this.color, required this.boldWords});

  RichText highlightedText(String text, List<String> boldWords){
    List<TextSpan> spans = [];
    int lastIndex = 0;

    for(int i = 0; i < boldWords.length; i++){
      String boldWord = boldWords[i];
      int index = text.indexOf(boldWord);

      if(index != -1){
        // Adiciona o texto antes da palavra em negrito
        if(index > lastIndex){
          spans.add(TextSpan(text: text.substring(lastIndex, index), style: TextStyle(fontSize: 20, color: color, fontFamily: 'Sophisto', fontWeight: FontWeight.w100)));
        }

        // Adiciona a palavra em negrito
        spans.add(TextSpan(text: boldWord, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color, fontFamily: 'Sophisto')));

        lastIndex = index + boldWord.length;
      }
    }

    // Adiciona o texto restante
    if(lastIndex < text.length){
      spans.add(TextSpan(text: text.substring(lastIndex), style: TextStyle(fontSize: 20, color: color, fontFamily: 'Sophisto', fontWeight: FontWeight.w100)));
    }

    return RichText(
      text: TextSpan(
        children: spans
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: FadingEdgeScrollView.fromSingleChildScrollView(
            gradientFractionOnStart: 0.1,
            gradientFractionOnEnd: 0.3,
            child: SingleChildScrollView(controller: controller, child: highlightedText(text, boldWords))),
        ),
      ),
    );
  }
}