import 'dart:convert';

import 'package:fever/model/citys/citys.dart';
import 'package:fever/model/climate.dart';
import 'package:fever/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Network {
  String _content = '';

  Future<List<Citys>> getCitys({
    Map<String, dynamic> params = const {},
  }) async {
    List<Citys> citys = [];
    if (params.isNotEmpty) {
      _content =
          '?${(params.keys.map((key) => '$key=${Uri.encodeQueryComponent(params[key])}')).join('&')}';
    }

    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      debugPrint('${WebService.urlBaseCitys}${EndPoint.baseCitys}$_content');

      await http
          .get(
        Uri.parse('${WebService.urlBaseCitys}${EndPoint.baseCitys}$_content'),
        headers: headers,
      )
          .then((response) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          debugPrint(response.body.replaceAll('\'', ''));
          List<dynamic> responseJson =
              jsonDecode(response.body.replaceAll('\'', ''));
          for (var element in responseJson) {
            citys.add(Citys.fromJson(element));
          }
        } else {
          debugPrint('Ha ocurrido un error:');
          debugPrint(response.statusCode.toString());
        }
      });
    } catch (_) {
      debugPrint(_.toString());
    }
    return citys;
  }

  Future<Climate?> getDataClime({
    Map<String, dynamic> params = const {},
  }) async {
    Climate? _climate;
    if (params.isNotEmpty) {
      _content =
          '?${(params.keys.map((key) => '$key=${Uri.encodeQueryComponent(params[key])}')).join('&')}';
    }

    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      debugPrint('${WebService.urlBaseClime}${EndPoint.base}$_content');

      await http
          .get(
        Uri.parse('${WebService.urlBaseClime}${EndPoint.base}$_content'),
        headers: headers,
      )
          .then((response) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          debugPrint(response.body.replaceAll('\'', ''));
          _climate =
              Climate.fromJson(json.decode(response.body.replaceAll('\'', '')));
        } else {
          debugPrint('Ha ocurrido un error:');
          debugPrint(response.statusCode.toString());
        }
      });
    } catch (_) {
      debugPrint(_.toString());
    }
    return _climate;
  }
}
