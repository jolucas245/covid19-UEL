import 'package:app_covid/app/global/appbar_global.dart';
import 'package:app_covid/app/global/button_wiget.dart';
import 'package:app_covid/app/global/custom_colors.dart';
import 'package:app_covid/app/view/subviews/autocuidado/controllers/autocuidado_controller.dart';
import 'package:flutter/material.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import '../../../global/images_file.dart';

class AutocuidadoView extends StatefulWidget {
  const AutocuidadoView({super.key});

  @override
  State<AutocuidadoView> createState() => _AutocuidadoViewState();

}

class _AutocuidadoViewState extends State<AutocuidadoView> {

  AutocuidadoController controller = AutocuidadoController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      controller.init(context, refresh);
    });
    controller.pageController!.addListener(() {
      if(controller.currentPage.value == 3){
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
        safeColor: CustomColors.autocuidadoAppbarColor,
        color: CustomColors.autocuidadoAppbarColor,
        text: "Autocuidado",
        onTap: () => context.pop()
      ),
      backgroundColor: CustomColors.autocuidadoBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: ImagesFiles.bubbleAutocuidado,
            ),
            Stack(
              children: [
                Container(
                  height: 350,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll){
                      overscroll.disallowIndicator();
                      return true;
                    },
                    child: ExpandablePageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index){
                        return controller.pages[index];
                      },
                      onPageChanged: (int index){
                        controller.currentPage.value = index;
                      },
                      controller: controller.pageController,
                    ),
                  ),
                ),
                Align(alignment: Alignment.centerRight, child: ImagesFiles.penguin),
              ],
            ),
            CirclePageIndicator(
              currentPageNotifier: controller.currentPage, 
              itemCount: 4,
              selectedDotColor: CustomColors.autocuidadoAppbarColor,
              dotColor: const Color(0xff88B7E2),
            ),
            const SizedBox(height: 20,),
            ButtonWidget(
              text: "Vamos continuar esse processo !!", 
              onPressed: () => context.push("/autocuidadonext"),
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
    setState(() {});
  }
}
