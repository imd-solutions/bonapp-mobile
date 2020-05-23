import 'package:flutter_bonapp/models/location.dart';

import '../base_model.dart';

class LocationsViewModel extends BaseModel {
  Locations _location;

  LocationsViewModel({Locations location}) : _location = location;

  Locations get info {
    return Locations(
      id: _location.id,
      name: _location.name,
    );
  }
}
