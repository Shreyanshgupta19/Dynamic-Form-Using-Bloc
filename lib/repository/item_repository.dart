

import 'package:flutter_4a/model/item_model.dart';

class ItemRepository {

  int _length = 1;

  int get length => _length;

  set length(int newLength) {
  _length = newLength;
  }

  Future<List<ItemModel>> fetchItem() async{
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(length));
  }

  List<ItemModel> _generateList(int length) {
    return List.generate(length, (index) => ItemModel(id: index.toString(), value: 'Item $index' ) );

  }
  void increaseLength() {
    _length++;
  }

  void decreaseLength() {
    if (_length > 0) {
      _length--;
    }
  }
}
