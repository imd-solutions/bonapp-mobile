import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/scan/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

Container scanWidgetBuilder(double height, ScanViewModel data) {
  return Container(
    height: height * 0.75,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: data.camState
              ? Center(
                  child: SizedBox(
                    width: 300.0,
                    height: 600.0,
                    child: QrCamera(
                      onError: (context, error) => Text(
                        error.toString(),
                        style: TextStyle(color: Colors.red),
                      ),
                      qrCodeCallback: (code) => print(code),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.orange,
                            width: 10.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: Text("Camera inactive"),
                ),
        ),
        Text("QRCODE: ${data.qrCode}"),
      ],
    ),
  );
}

class ScanMobilePortrait extends BaseModelWidget<ScanViewModel> {
  @override
  Widget build(BuildContext context, ScanViewModel data) {
    var height = MediaQuery.of(context).size.height;
    return scanWidgetBuilder(height, data);
  }
}

class ScanMobileLandscape extends BaseModelWidget<ScanViewModel> {
  @override
  Widget build(BuildContext context, ScanViewModel data) {
    var height = MediaQuery.of(context).size.height;
    return scanWidgetBuilder(height, data);
  }
}
