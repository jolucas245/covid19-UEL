import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import '../../../global/appbar_global.dart';
import '../../../global/button_wiget.dart';
import '../../../global/custom_colors.dart';
import '../../../global/images_file.dart';
import 'controllers/ansiedade_controller.dart';

class AnsiedadeToLeadView extends StatefulWidget {
  const AnsiedadeToLeadView({super.key});

  @override
  State<AnsiedadeToLeadView> createState() => _AnsiedadeToLeadViewState();
}

class _AnsiedadeToLeadViewState extends State<AnsiedadeToLeadView> {

  AnsiedadeController controller = AnsiedadeController();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      controller.init(context, refresh);
    });
    controller.pageController!.addListener(() {
      if(controller.currentPage.value == 2){
        setState(() {
          controller.isButtonDisabled = false;
        });
      }else{
        setState(() {
          controller.isButtonDisabled = true;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.pageController!.dispose();
    debugPrint("O Listener foi removido");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGlobal(
        safeColor: CustomColors.ansiedadeAppbarColor,
        color: CustomColors.ansiedadeAppbarColor,
        text: "Ansiedade",
        onTap: () => context.pop()
      ),
      backgroundColor: CustomColors.ansiedadeBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.only(top: 10, right: 30),
                        width: 250,
                        child: ImagesFiles.bubbleAnsiedadeToLead,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll){
                          overscroll.disallowIndicator();
                          return true;
                        },
                        child: ExpandablePageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.pagesToLead.length,
                          itemBuilder: (context, index){
                            return controller.pagesToLead[index];
                          },
                          onPageChanged: (int index){
                            controller.currentPage.value = index;
                          },
                          controller: controller.pageController,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:60),
                  child: Align(
                    alignment: Alignment.centerRight, 
                    child: Transform.scale(
                      scaleX: -1,
                      child: ImagesFiles.penguinAnsiedade
                    )
                  ),
                ),
              ],
            ),
            CirclePageIndicator(
              currentPageNotifier: controller.currentPage, 
              itemCount: controller.pagesToLead.length,
              selectedDotColor: CustomColors.ansiedadeAppbarColor,
              dotColor: const Color(0xffFFD575),
            ),
            const SizedBox(height: 20,),
            ButtonWidget(
              text: "Que estratégias posso utilizar ?", 
              onPressed: ()=>context.push("/autocuidadonext"),
              textColor: Colors.white,
              width: 300,
              disabled: controller.isButtonDisabled
            )
          ],
        ),
      ),
    );
  }

  void refresh(){
    setState(() {
      
    });
  }
}