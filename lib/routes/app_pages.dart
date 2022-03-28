
import 'package:cash_book/routes/routes.dart';
import 'package:cash_book/views/coming_time.dart';
import 'package:cash_book/views/home.dart';
import 'package:cash_book/views/list_transaction_all.dart';
import 'package:cash_book/views/list_transactions_input.dart';
import 'package:cash_book/views/list_transactions_output.dart';

import 'package:get/get.dart';

import '../views/splash_view.dart';

class AppPage {
  static const INITIAL = Routes.SPLASH_VIEW;
  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => Home(),
        transition: Transition.fade,
    ),  
    GetPage(
        name: Routes.LIST_TRANSACTIONS,
        page: () => ListTransactionsView(),
        transition: Transition.fade,
      ),
    GetPage(
        name: Routes.LIST_INPUTS,
        page: () => ListTransactionsInput(),
        transition: Transition.fade,
       ),
    GetPage(
        name: Routes.LIST_OUTPUTS,
        page: () => ListTransactionsOutputs(),
        transition: Transition.fade,
     ),

        GetPage(
        name: Routes.LIST_TIMEOUTS,
        page: () => ListComingTime(),
        transition: Transition.fade,
   ),

           GetPage(
        name: Routes.SPLASH_VIEW,
        page: () => SplashView(),
        transition: Transition.leftToRightWithFade,
       ),
  ];
}
