import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../config/app_translations.dart';

class HomeController extends GetxController {
  final _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool newValue) => _isLoading.value = newValue;

  DateFormat getDateFormat() {
    final languageCode = Get.locale!.languageCode;

    final _dateFormatBrazil = DateFormat('dd/MM/yyyy');
    final _dateFormatSpain = DateFormat('dd-MM-yyyy');
    final _dateFormatEua = DateFormat('yyyy-MM-dd');

    if (languageCode == AppTranslationStrings.ptBr) {
      return _dateFormatBrazil;
    } else if (languageCode == AppTranslationStrings.esES) {
      return _dateFormatSpain;
    } else {
      return _dateFormatEua;
    }
  }

  NumberFormat getCurrencyFormat() {
    final languageCode = Get.locale!.languageCode;

    final _currencyDolar = NumberFormat.simpleCurrency();
    final _currencyBrazil = NumberFormat.simpleCurrency(
        locale: AppTranslationStrings.portugueseLanguage);
    final _currencySpain = NumberFormat.simpleCurrency(
        locale: AppTranslationStrings.spanishLanguage);

    if (languageCode == AppTranslationStrings.ptBr) {
      return _currencyBrazil;
    } else if (languageCode == AppTranslationStrings.enUS) {
      return _currencyDolar;
    } else {
      return _currencySpain;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 3));
    isLoading = false;
  }
}
