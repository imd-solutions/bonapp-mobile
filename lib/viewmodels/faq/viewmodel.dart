import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/faq.dart';
import 'package:flutter_bonapp/services/faq_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';

class FaqViewModel extends BaseModel {
  FaqService faqService = locator<FaqService>();

  List<Faq> allFaqs;

  void initialise() {
    setState(ViewState.Busy);
    notifyListeners();
    _updateFaqInfo();
    notifyListeners();
  }

  Future<void> _updateFaqInfo() async {
    allFaqs = await faqService.getActiveFAQ();

    setState(ViewState.Completed);
    notifyListeners();
  }
}
