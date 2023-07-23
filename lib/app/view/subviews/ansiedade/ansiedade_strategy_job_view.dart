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

class AnsiedadeStrategyJobView extends StatefulWidget {
  const AnsiedadeStrategyJobView({super.key});

  @override
  State<AnsiedadeStrategyJobView> createState() => _AnsiedadeToLeadViewState();
}

class _AnsiedadeToLeadViewState extends State<AnsiedadeStrategyJobView> {

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
        child: Stack(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: ImagesFiles.bubbleAnsiedadeStrategyJob,
                  ),
                ),
                Container(
                  height: 469,
                  margin: const EdgeInsets.only(top: 20, bottom: 60),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll){
                      overscroll.disallowIndicator();
                      return true;
                    },
                    child: ExpandablePageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.pagesStrategyJob.length,
                      itemBuilder: (context, index){
                        return controller.pagesStrategyJob[index];
                      },
                      onPageChanged: (int index){
                        controller.currentPage.value = index;
                      },
                      controller: controller.pageController,
                    ),
                  ),
                ),
                CirclePageIndicator(
                  currentPageNotifier: controller.currentPage, 
                  itemCount: controller.pagesStrategyJob.length,
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
            Padding(
              padding: const EdgeInsets.only(top:400.0),
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
      ),
    );
  }

  void refresh(){
    setState(() {
      
    });
  }
}