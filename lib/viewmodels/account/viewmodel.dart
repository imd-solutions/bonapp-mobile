import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/location.dart';
import 'package:flutter_bonapp/models/nationality.dart';
import 'package:flutter_bonapp/models/profession.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';

class AccountViewModel extends BaseModel {
  UserService userService = locator<UserService>();

  List<Locations> locations;
  List<Professions> professions;
  List<Nationality> nationality;

  void initialise() {
    setState(ViewState.Busy);
    notifyListeners();
    _getDropdownInformation();
    notifyListeners();
  }

  Future<void> _getDropdownInformation() async {
    locations = await userService.getLocations();
    professions = await userService.getProfessions();
    nationality = await userService.getNationalites();

    setState(ViewState.Completed);
    notifyListeners();
  }
}
