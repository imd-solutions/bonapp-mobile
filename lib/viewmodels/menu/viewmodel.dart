import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/services/menu_service.dart';
import 'package:flutter_bonapp/utils/enum.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import '../../enums/viewstate.dart';
import '../../services/locator.dart';
import '../base_model.dart';

class MenuViewModel extends BaseModel {
  Menu _menu;
  Items _featuredItems;
  MenuListViewModel menuListViewModel = locator<MenuListViewModel>();
  List<MenuViewModel> menus = List<MenuViewModel>();
  List<MenuViewModel> featuredItems = List<MenuViewModel>();

  MenuViewModel({Menu menu, Items items})
      : _menu = menu,
        _featuredItems = items;

  var loadingStatus = LoadingStatus.loading;

  void initialise() {
    setState(ViewState.Busy);
    menuListViewModel.getAllMenus().then(
      (_) {
        this.menus = menuListViewModel.menus;
        setState(ViewState.Completed);
      },
    );

    menuListViewModel.getFeaturedItems().then((_) {
      this.featuredItems = menuListViewModel.featuredItems;
      setState(ViewState.Completed);
    });
    notifyListeners();
  }

  Menu get info {
    return Menu(
      name: this._menu.name,
      description: this._menu.description,
      imgUrl: this._menu.imgUrl,
      items: this._menu.items,
    );
  }

  Items get itemInfo {
    return Items(
      name: this._featuredItems.name,
      description: this._featuredItems.description,
      imgUrl: this._featuredItems.imgUrl,
      price: this._featuredItems.price,
    );
  }
}

class MenuListViewModel extends BaseModel {
  List<MenuViewModel> menus = List<MenuViewModel>();
  List<MenuViewModel> featuredItems = List<MenuViewModel>();

  Future<void> getAllMenus() async {
    setState(ViewState.Busy);
    notifyListeners();

    List<Menu> menus = await MenuService().getMenus();

    this.menus = menus.map((json) => MenuViewModel(menu: json)).toList();

    setState(ViewState.Completed);

    notifyListeners();
  }

  Future<void> getFeaturedItems() async {
    setState(ViewState.Busy);
    notifyListeners();

    List<Items> featuredItems = await MenuService().getFeaturedItems();

    this.featuredItems = featuredItems.map((json) => MenuViewModel(items: json)).toList();

    setState(ViewState.Completed);

    notifyListeners();
  }
}
