import 'package:flutter/material.dart';
import 'package:flutter_app/models/extensions/cash_extension.dart';
import 'package:flutter_app/models/mocks/currencies_model.dart';
import './home_view_model.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder(
          future: getCurrencies(),
          builder: (context, AsyncSnapshot<List<CurrenciesModel>> snap) {
            if (!snap.hasData) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (snap.hasError) {
              return Center(child: Text('Error ${snap.hasError}'));
            } else {
              List<CurrenciesModel> data = snap.data!;

              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text('${data[index].title}'.cash),
                  leading: CircleAvatar(child: Text(data[index].code!)),
                  trailing: Text("${data[index].cbPrice}"),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
