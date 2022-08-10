import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/mocks/currencies_model.dart';
import './home.dart';

abstract class HomeViewModel extends State<Home> {
  final String baseUrl = 'https://nbu.uz/uz';

  Future<List<CurrenciesModel>> getCurrencies() async {
    Response res = await Dio().get("$baseUrl/exchange-rates/json/");
    switch (res.statusCode) {
      case HttpStatus.ok:
        if (res.data is List) {
          return (res.data as List)
              .map((e) => CurrenciesModel.fromJson(e))
              .toList();
        } else {
          return [].cast<CurrenciesModel>();
        }
      default:
        return [].cast<CurrenciesModel>();
    }
  }
}
