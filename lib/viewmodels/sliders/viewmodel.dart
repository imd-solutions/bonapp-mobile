import 'package:flutter_resp_mvvm/enums/viewstate.dart';
import 'package:flutter_resp_mvvm/models/sliders.dart';
import 'package:flutter_resp_mvvm/services/locator.dart';
import 'package:flutter_resp_mvvm/services/slider_service.dart';
import 'package:flutter_resp_mvvm/viewmodels/base_model.dart';

class SlidersViewModel extends BaseModel {
  Sliders _slider;
  int _currentPage = 0;
  SliderListViewModel sliderListViewModel = locator<SliderListViewModel>();
  List<SlidersViewModel> sliders = List<SlidersViewModel>();

  SlidersViewModel({Sliders slider}) : _slider = slider;

  int get currentPage => _currentPage;

  setCur(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void initialise() {
    setState(ViewState.Busy);
    sliderListViewModel.getAllSliders().then(
      (_) {
        this.sliders = sliderListViewModel.sliders;
        setState(ViewState.Completed);
      },
    );
    notifyListeners();
  }

  Sliders get info {
    return Sliders(title: this._slider.title, description: this._slider.description, imgUrl: this._slider.imgUrl);
  }
}

class SliderListViewModel extends BaseModel {
  List<SlidersViewModel> sliders = List<SlidersViewModel>();

  Future<void> getAllSliders() async {
    setState(ViewState.Busy);
    notifyListeners();

    List<Sliders> listSliders = await SliderService().getSliders();

    this.sliders = listSliders.map((json) => SlidersViewModel(slider: json)).toList();

    setState(ViewState.Completed);

    notifyListeners();
  }
}
