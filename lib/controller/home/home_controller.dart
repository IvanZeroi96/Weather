import 'package:fever/model/citys/citys.dart';
import 'package:fever/model/climate.dart';
import 'package:fever/model/common.dart';
import 'package:fever/model/constants.dart';
import 'package:fever/model/l10n/l10n.dart';
import 'package:fever/model/network/network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String _latitud = '19.761461';
  String _longitud = '-99.065344';
  String _cityName = '';
  String _citySelect = '';
  String _image = 'https://img.icons8.com/fluency/240/null/sun.png';
  String _grados = '0°';
  String _minGrados = '0°';
  String _maxGrados = '0°';
  String _lluvia = '0';
  String _viento = '0';
  String _humedad = '0';
  String _selectCityTitle = '';
  List<Citys> _citys = [];
  Climate? _climate;
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  String get cityName => _cityName;
  String get image => _image;
  String get grados => _grados;
  String get minGrados => _minGrados;
  String get maxGrados => _maxGrados;
  String get viento => _viento;
  String get lluvia => _lluvia;
  String get humedad => _humedad;

  @override
  void onInit() {
    // TODO: implement onInit
    _initialLabel();
    _getCitys();
    super.onInit();
  }

  void _getCitys() async {
    Network response = Network();
    _citys = await response.getCitys();

    _isLoading = false;
    update();
    if (_citys.isNotEmpty) {
      Citys initial = _citys.first;
      _cityName = initial.display;
      _citySelect = initial.cityName;
      _latitud = initial.lat.toString();
      _longitud = initial.long.toString();
    }
    _getClime();
  }

  void _getClime() async {
    _isLoading = true;
    update();

    Network response = Network();
    _climate = await response.getDataClime(
      params: {
        'q': _citySelect,
        'appid': Id.appId,
      },
    );
    if (_climate != null) {
      _image = Common().selectImageUrl(_climate!.weather.first.main);
      _grados = '${(_climate!.main.temp - 273.15).round()}°';
      _minGrados = '${(_climate!.main.tempMin - 273.15).round()}°';
      _maxGrados = '${(_climate!.main.tempMax - 273.15).round()}°';
      _humedad = '${_climate!.main.humidity} %';
      _viento = '${_climate!.wind.speed}';
      _lluvia = '${(_climate!.main.pressure / 10).round()}';
    }

    _isLoading = false;
    update();
  }

  void getCitySelect() async {
    Get.dialog(
      SimpleDialog(
        title: Text(_selectCityTitle),
        children: _buildOptions(),
      ),
    );
  }

  List<Widget> _buildOptions() {
    List<Widget> list = [];
    for (var element in _citys) {
      list.add(SimpleDialogOption(
        onPressed: () {
          _latitud = element.lat.toString();
          _longitud = element.long.toString();
          _cityName = element.display;
          _citySelect = element.cityName;
          update();
          Navigator.of(Get.context!).pop();
          _getClime();
        },
        child: Text(element.display),
      ));
    }
    return list;
  }

  void _initialLabel() {
    String a = Localizationes.of(Get.context!)!.today;
    _selectCityTitle = Localizationes.of(Get.context!)!.selectCityTitle;
  }
}
