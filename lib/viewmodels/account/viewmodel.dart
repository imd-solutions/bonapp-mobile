import 'package:flutter/material.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/location.dart';
import 'package:flutter_bonapp/models/nationality.dart';
import 'package:flutter_bonapp/models/profession.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountViewModel extends BaseModel {
  UserService userService = locator<UserService>();

  List<Locations> locations;
  List<Professions> professions;
  List<Nationality> nationality;
  User user;

  int selectedLocation = 0;
  String selectedLocationName = '';
  int selectedProfession = 0;
  String selectedProfessionName = '';
  int selectedNationality = 0;
  String selectedNationalityName = '';

  bool emailNotification = false;
  bool appNotification = false;
  bool textNotification = false;

  void initialise() {
    setState(ViewState.Busy);
    notifyListeners();
    _getDropdownInformation();
    notifyListeners();
  }

  Future<void> _getDropdownInformation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('userId');

    user = await userService.getUser(id);
    locations = await userService.getLocations();
    professions = await userService.getProfessions();
    nationality = await userService.getNationalites();

    emailNotification = user.profile.alerts.email;
    appNotification = user.profile.alerts.notification;
    textNotification = user.profile.alerts.text;

    if (user.profile.location != null) {
      selectedLocation = int.parse(user.profile.location.id);
      selectedLocationName = user.profile.location.name;
    }
    if (user.profile.profession != null) {
      selectedProfession = int.parse(user.profile.profession.id);
      selectedProfessionName = user.profile.profession.name;
    }
    if (user.profile.nationality != null) {
      selectedNationality = int.parse(user.profile.nationality.id);
      selectedNationalityName = user.profile.nationality.name;
    }

    setState(ViewState.Completed);
    notifyListeners();
  }

  void updateSelected(String type, int index, String name) {
    switch (type) {
      case 'Site':
        {
          selectedLocation = index;
          selectedLocationName = name;
        }
        break;
      case 'Profession':
        {
          selectedProfession = index;
          selectedProfessionName = name;
        }
        break;
      default:
        {
          selectedNationality = index;
          selectedNationalityName = name;
        }
        break;
    }
    notifyListeners();
  }

  void updateNotification(String type, bool value) {
    switch (type) {
      case 'email':
        {
          emailNotification = value;
        }
        break;
      case 'app':
        {
          appNotification = value;
        }
        break;
      default:
        {
          textNotification = value;
        }
        break;
    }
    notifyListeners();
  }
}
