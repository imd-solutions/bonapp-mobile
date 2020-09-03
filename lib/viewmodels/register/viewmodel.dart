import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/models/legal.dart';
import 'package:flutter_bonapp/models/location.dart';
import 'package:flutter_bonapp/models/message.dart';
import 'package:flutter_bonapp/models/profession.dart';
import 'package:flutter_bonapp/models/title.dart';
import 'package:flutter_bonapp/models/user.dart';
import 'package:flutter_bonapp/services/legal_service.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:flutter_bonapp/services/user_service.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:flutter_bonapp/viewmodels/locations/viewmodel.dart';
import 'package:flutter_bonapp/viewmodels/professions/viewmodel.dart';
import 'package:flutter_bonapp/viewmodels/titles/viewmodel.dart';

class RegisterViewModel extends BaseModel {
  UserService userService = locator<UserService>();
  LegalService legalService = locator<LegalService>();
  List<TitleViewModel> titles = List<TitleViewModel>();
  List<LocationsViewModel> locations = List<LocationsViewModel>();
  List<ProfessionsViewModel> professions = List<ProfessionsViewModel>();

  List<Legal> legals;

  int titleDropdown = 0;
  int professionDropdown = 0;
  int locationDropdown = 0;

  bool emailNotification = true;
  bool appNotification = true;
  bool textNotification = true;

  int title;
  String firstName;
  String lastName;
  String email;
  String mobile;
  int location;
  int profession;
  String token;
  String password;
  String confirmPassword;

  dynamic checkbox = [false, false, false, false];

  void updateCheckBox(int index, bool value) {
    checkbox[index] = value;
    notifyListeners();
  }

  void initialise() {
    setState(ViewState.Busy);
    notifyListeners();

    this.getTitles();
    this.getLocations();
    this.getProfessions();
    this.getLegalInfo();
    notifyListeners();
  }

  void processBool(String name, bool val) {
    if(name == 'email') {
      emailNotification = val;
    } else if (name == 'app') {
      appNotification = val;
    }
    else {
      textNotification = val;
    }
    notifyListeners();
  }

  void updateTitleNumber(int index) {
    titleDropdown = index;
    notifyListeners();
  }

  void updateProfessionNumber(int index) {
    professionDropdown = index;
    notifyListeners();
  }

  void updateLocationNumber(int index) {
    locationDropdown = index;
    notifyListeners();
  }

  void updateTitle(int value) {
    title = value;
  }

  void updateFirstName(String value) {
    firstName = value;
  }

  void updateLastName(String value) {
    lastName = value;
  }

  void updateEmail(String value) {
    email = value;
  }

  void updateMobile(String value) {
    mobile = value;
  }

  void updateLocation(int value) {
    location = value;
  }

  void updateProfession(int value) {
    profession = value;
  }

  void updatePassword(String value) {
    password = value;
  }

  void updateConfirmPassword(String value) {
    confirmPassword = value;
  }

  void initialVariables() {
    firstName = firstName;
    lastName = lastName;
    email = email;
    mobile = mobile;
    notifyListeners();
  }

  Future<void> getTitles() async {
    List<Titles> response = await userService.getTitles();

    this.titles = response.map((json) => TitleViewModel(title: json)).toList();

    setState(ViewState.Completed);
    notifyListeners();
  }

  Future<void> getLocations() async {
    List<Locations> response = await userService.getLocations();

    this.locations = response.map((json) => LocationsViewModel(location: json)).toList();

    setState(ViewState.Completed);
    notifyListeners();
  }

  Future<void> getProfessions() async {
    List<Professions> response = await userService.getProfessions();

    this.professions = response.map((json) => ProfessionsViewModel(profession: json)).toList();

    setState(ViewState.Completed);
    notifyListeners();
  }

  Future<Message> registerUser(User user, Profile profile, int location, int profession, bool email, bool app, bool text) async {
    setState(ViewState.Processing);
    notifyListeners();

    FirebaseMessaging _fcm = FirebaseMessaging();

    String token = await _fcm.getToken();

    Message response = await userService.registerUser(user, profile, location, profession, token, email, app, text);

    setState(ViewState.Completed);
    notifyListeners();

    return response;
  }

  Future<void> getLegalInfo() async {
    legals = await legalService.getLegalsOrder();
    setState(ViewState.Completed);
    notifyListeners();
  }
}
