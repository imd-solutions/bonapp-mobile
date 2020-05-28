import 'package:flutter/material.dart';
import 'package:flutter_bonapp/viewmodels/account/viewmodel.dart';
import 'package:flutter_bonapp/widgets/base_model_widget.dart';

class AccountTabletPortrait extends BaseModelWidget<AccountViewModel> {
  @override
  Widget build(BuildContext context, AccountViewModel data) {
    return Container(
      child: Text('Account Page.'),
    );
  }
}

class AccountTabletLandscape extends BaseModelWidget<AccountViewModel> {
  @override
  Widget build(BuildContext context, AccountViewModel data) {
    return Container(
      child: Text('Account Page.'),
    );
  }
}
