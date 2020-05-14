import 'package:flutter_bonapp/models/title.dart';

import '../base_model.dart';

class TitleViewModel extends BaseModel {
  Titles _title;

  TitleViewModel({Titles title}) : _title = title;

  Titles get info {
    return Titles(
      id: _title.id,
      name: _title.name,
    );
  }
}
