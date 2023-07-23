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

class AnsiedadeIdentifyView extends StatefulWidget {
  const AnsiedadeIdentifyView({super.key});

  @override
  State<AnsiedadeIdentifyView> createState() => _AnsiedadeIdentifyViewState();
}

class _AnsiedadeIdentifyViewState extends State<AnsiedadeIdentifyView> {

  AnsiedadeController controller = AnsiedadeController();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      controller.init(context, refresh);
    });
    controller.pageController!.addListener(() {
      if(controller.currentPage.value == 1){
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
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(top: 10, left: 30),
                width: 200,
                child: ImagesFiles.bubbleAnsiedadeIdentify,
              ),
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll){
                      overscroll.disallowIndicator();
                      return true;
                    },
                    child: ExpandablePageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.pagesIdentify.length,
                      itemBuilder: (context, index){
                        return controller.pagesIdentify[index];
                      },
                      onPageChanged: (int index){
                        controller.currentPage.value = index;
                      },
                      controller: controller.pageController,
                    ),
                  ),
                ),
                Align(alignment: Alignment.centerLeft, child: ImagesFiles.penguinAnsiedade),
              ],
            ),
            CirclePageIndicator(
              currentPageNotifier: controller.currentPage, 
              itemCount: controller.pagesIdentify.length,
              selectedDotColor: CustomColors.ansiedadeAppbarColor,
              dotColor: const Color(0xffFFD575),
            ),
            const SizedBox(height: 20,),
            ButtonWidget(
              text: "Como lidar ?", 
              onPressed: ()=>context.push("/ansiedadetolead"),
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