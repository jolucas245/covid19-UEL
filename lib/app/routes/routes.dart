import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../view/initial/initial_view.dart';
import '../view/lembre/lembre_view.dart';
import '../view/subviews/ansiedade/ansiedade_strategy_job_view.dart';
import '../view/subviews/ansiedade/ansiedade_strategy_now_view.dart';
import '../view/subviews/ansiedade/ansiedadeidentify_view.dart';
import '../view/subviews/ansiedade/ansiedadenext_view.dart';
import '../view/subviews/ansiedade/ansiedadetolead_view.dart';
import '../view/subviews/ansiedade/ansiedadewhat_view.dart';
import '../view/subviews/autocuidado/autocuidado_next.dart';
import '../view/subviews/autocuidado/autocuidado_view.dart';

final routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) => const MaterialPage(child: InitialView()),
    ),
    GoRoute(
      path: "/lembre",
      pageBuilder: (context, state) => const MaterialPage(child: LembreView())
    ),

    // Autocuidado
    GoRoute(
      path: "/autocuidado",
      pageBuilder: (context, state) => const MaterialPage(child: AutocuidadoView())
    ),
    GoRoute(
      path: "/autocuidadonext",
      pageBuilder: (context, state) => const MaterialPage(child: AutocuidadoNextView())
    ),

    //Ansiedade
    GoRoute(
      path: "/ansiedadewhat",
      pageBuilder: (context, state) => const MaterialPage(child: AnsiedadeWhatView())
    ),
    GoRoute(
      path: "/ansiedadeidentify",
      pageBuilder: (context, state) => const MaterialPage(child: AnsiedadeIdentifyView())
    ),
    GoRoute(
      path: "/ansiedadetolead",
      pageBuilder: (context, state) => const MaterialPage(child: AnsiedadeToLeadView())
    ),
    GoRoute(
      path: "/ansiedadenext",
      pageBuilder: (context, state) => const MaterialPage(child: AnsiedadeNextView())
    ),
    GoRoute(
      path: "/ansiedadestrategyjob",
      pageBuilder: (context, state) => const MaterialPage(child: AnsiedadeStrategyJobView())
    ),
    GoRoute(
      path: "/ansiedadestrategynow",
      pageBuilder: (context, state) => const MaterialPage(child: AnsiedadeStrategyNowView())
    ),
    
  ]
);