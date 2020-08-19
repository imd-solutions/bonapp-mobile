import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/message.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/scan_service.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  ScanService scanService = locator<ScanService>();

  String qrCode = '';
  bool camState = true;
  bool qrCodeSuccess = false;
  bool qrCodeFail = false;
  String qrCodeMessage = '';

  void initialise() {
    qrCodeSuccess = false;
    qrCodeFail = false;
    notifyListeners();
  }

  Future<Message> scanQRCode(String code) async {
    qrCodeFail = false;
    qrCodeMessage = '';
    setState(ViewState.Processing);
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt('userId');

    Message response = await scanService.scanQRCode(uid, code);

    if (response.status == 200) {
      qrCodeSuccess = true;
    } else {
      qrCodeFail = true;
    }

    qrCodeMessage = response.message;

    setState(ViewState.Completed);
    notifyListeners();

    return response;
  }

  Future<Message> scanQRCodeVoucher(String code) async {
    qrCodeFail = false;
    qrCodeMessage = '';
    setState(ViewState.Processing);
    notifyListeners();

    Message response = await scanService.scanQRCodeVoucher(code);

    if (response.status == 200) {
      qrCodeSuccess = true;
    } else {
      qrCodeFail = true;
    }

    qrCodeMessage = response.message;

    setState(ViewState.Completed);
    notifyListeners();

    return response;
  }

  void clearPage() {
    qrCodeSuccess = false;
    qrCodeFail = false;
    qrCodeMessage = '';
    notifyListeners();
  }
}
