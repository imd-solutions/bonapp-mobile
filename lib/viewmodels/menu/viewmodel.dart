import 'package:flutter_bonapp/models/menu.dart';
import 'package:flutter_bonapp/services/menu_service.dart';
import 'package:flutter_bonapp/utils/enum.dart';
import 'package:flutter_bonapp/viewmodels/base_model.dart';
import 'package:flutter_bonapp/enums/viewstate.dart';
import 'package:flutter_bonapp/services/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuViewModel extends BaseModel {
  Menu _menu;
  Items _featuredItems;
  Items _pickOfDayItems;
  MenuListViewModel menuListViewModel = locator<MenuListViewModel>();
  List<MenuViewModel> menus = List<MenuViewModel>();
  List<MenuViewModel> featuredItems = List<MenuViewModel>();
  List<MenuViewModel> pickOfDayItems = List<MenuViewModel>();

  MenuViewModel({Menu menu, Items items})
      : _menu = menu,
        _featuredItems = items,
        _pickOfDayItems = items;

  var loadingStatus = LoadingStatus.loading;

  Future<void> initialise() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('userId');

    setState(ViewState.Busy);
    menuListViewModel.getAllMenus().then(
      (_) {
        this.menus = menuListViewModel.menus;
        setState(ViewState.Completed);
      },
    );

//    menuListViewModel.getItemsCategory(id).then((_) {
//      this.featuredItems = menuListViewModel.featuredItems;
//      setState(ViewState.Completed);
//    });

    menuListViewModel.getFeaturedItems(id).then((_) {
      this.featuredItems = menuListViewModel.featuredItems;
      setState(ViewState.Completed);
    });

    menuListViewModel.getPickOfDayItems(id).then((_) {
      this.pickOfDayItems = menuListViewModel.pickOfDayItems;
      setState(ViewState.Completed);
    });
    notifyListeners();
  }

  Menu get info {
    return Menu(
      id: this._menu.id,
      name: this._menu.name,
      description: this._menu.description,
      imgIcon: this._menu.imgIcon,
      image: this._menu.image,
      items: this._menu.items,
    );
  }

  Items get itemInfo {
    return Items(
        id: this._featuredItems.id,
        name: this._featuredItems.name,
        subtitle: this._featuredItems.subtitle,
        description: this._featuredItems.description,
        image: this._featuredItems.image,
        price: this._featuredItems.price,
        pivot: ItemPivot(
          mainPrice: this._featuredItems.pivot.mainPrice,
        ));
  }

  Items get pickInfo {
    return Items(
      id: this._pickOfDayItems.id,
      name: this._pickOfDayItems.name,
      subtitle: this._pickOfDayItems.subtitle,
      description: this._pickOfDayItems.description,
      image: this._pickOfDayItems.image,
      price: this._pickOfDayItems.price,
      pivot: ItemPivot(
        mainPrice: this._pickOfDayItems.pivot.mainPrice,
      ),
    );
  }
}

class MenuListViewModel extends BaseModel {
  List<MenuViewModel> menus = List<MenuViewModel>();
  List<MenuViewModel> featuredItems = List<MenuViewModel>();
  List<MenuViewModel> pickOfDayItems = List<MenuViewModel>();

  Future<void> getAllMenus() async {
    setState(ViewState.Busy);
    notifyListeners();

    List<Menu> menus = await MenuService().getMenus();

    this.menus = menus.map((json) => MenuViewModel(menu: json)).toList();

    setState(ViewState.Completed);

    notifyListeners();
  }

  Future<void> getFeaturedItems(int id) async {
    setState(ViewState.Busy);
    notifyListeners();

    List<Items> featuredItems = await MenuService().getFeaturedItems(id);

    this.featuredItems = featuredItems.map((json) => MenuViewModel(items: json)).toList();

    setState(ViewState.Completed);

    notifyListeners();
  }

  Future<void> getPickOfDayItems(int id) async {
    setState(ViewState.Busy);
    notifyListeners();

    List<Items> pickOfDayItems = await MenuService().getPickOfDayItems(id);

    this.pickOfDayItems = pickOfDayItems.map((json) => MenuViewModel(items: json)).toList();

    setState(ViewState.Completed);

    notifyListeners();
  }
}
