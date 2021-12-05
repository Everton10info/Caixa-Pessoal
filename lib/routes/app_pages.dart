import 'package:cash_book/dependencies/dependencies.dart';
import 'package:cash_book/routes/routes.dart';
import 'package:cash_book/views/home.dart';
import 'package:cash_book/views/list_transaction_view.dart';

import 'package:get/get.dart';

class AppPage {
  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => MyHome(),
        transition: Transition.fade,
        binding: HomeBindings()),
    GetPage(
        name: Routes.LIST_TRANSACTIONS,
        page: () => ListTransactionsView(),
        transition: Transition.fade,
        binding: HomeBindings()),
  ];
}
