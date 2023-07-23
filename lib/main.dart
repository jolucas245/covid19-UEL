import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'app/routes/routes.dart';
import 'package:flutter/foundation.dart';

void main(){
  if(kIsWeb){
    runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => const CovidApp(),
      )
    );
  }else{
    runApp(
      const CovidApp()
    );
  }
}

class CovidApp extends StatelessWidget {
  const CovidApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Suporte Covid",
      debugShowCheckedModeBanner: false,
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
      // Device Preview
      useInheritedMediaQuery: true,
      locale: kIsWeb ? DevicePreview.locale(context) : null,
      builder: kIsWeb ? DevicePreview.appBuilder : null,
    );
  }
}


































