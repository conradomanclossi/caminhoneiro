import 'package:caminhoneiro_app/controllers/item_viagem_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ItemViagem extends StatelessWidget {
  final ItemModelViagem item;

  const ItemViagem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListTile(
          title: Text(item.viagemSaida),
          trailing: Text(item.viagemChegada),
        );
      },
    );
  }
}
