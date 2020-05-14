import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/services/menu_service.dart';
import 'package:flutter_bonapp/utils/enum.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import '../../enums/viewstate.dart';
import '../../services/locator.dart';
import '../base_model.dart';

class MenuViewModel extends BaseModel {
  Menu _menu;
  MenuListViewModel menuListViewModel = locator<MenuListViewModel>();
  List<MenuViewModel> menus = List<MenuViewModel>();

  MenuViewModel({Menu menu}) : _menu = menu;

  var loadingStatus = LoadingStatus.loading;

  void initialise() {
    setState(ViewState.Busy);
    menuListViewModel.getAllMenus().then(
      (_) {
        this.menus = menuListViewModel.menus;
        setState(ViewState.Completed);
      },
    );
    notifyListeners();
  }

  Menu get info {
    return Menu(
      name: this._menu.name,
      description: this._menu.description,
      imgUrl: this._menu.imgUrl,
      items: this._menu.items
    );
  }
}

class MenuListViewModel extends BaseModel {
  List<MenuViewModel> menus = List<MenuViewModel>();

  Future<void> getAllMenus() async {
    setState(ViewState.Busy);
    notifyListeners();

    List<Menu> listSliders = await MenuService().getMenus();

    this.menus = listSliders.map((json) => MenuViewModel(menu: json)).toList();

    setState(ViewState.Completed);

    notifyListeners();
  }
}
