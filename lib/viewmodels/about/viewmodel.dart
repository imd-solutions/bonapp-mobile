import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/page.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/page_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';

class AboutViewModel extends BaseModel {
  PageService pageService = locator<PageService>();

  Page page;

  void initialise() {
    setState(ViewState.Busy);
    notifyListeners();
    _updatePageInfo();
    notifyListeners();
  }

  Future<void> _updatePageInfo() async {
    page = await pageService.getActivePage(1);

    setState(ViewState.Completed);
    notifyListeners();
  }
}
