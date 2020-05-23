import 'package:flutter_bonapp/models/profession.dart';

import '../base_model.dart';

class ProfessionsViewModel extends BaseModel {
  Professions _profession;

  ProfessionsViewModel({Professions profession}) : _profession = profession;

  Professions get info {
    return Professions(
      id: _profession.id,
      name: _profession.name,
    );
  }
}
