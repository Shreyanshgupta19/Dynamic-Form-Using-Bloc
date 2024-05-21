part of 'item_app_bloc.dart';

abstract class ItemEvents  extends Equatable {
  const ItemEvents();

@override
List<Object> get props => [];
}

class FetchItemList extends ItemEvents {}

class Item1 extends ItemEvents {
  Item1({required this.item1,});
  ItemModel item1;
}

class Item2 extends ItemEvents {
  Item2({required this.item2,});
  ItemModel item2;
}

class Item3 extends ItemEvents {
  Item3({required this.item3,});
  ItemModel item3;
}

class Value1 extends ItemEvents {
  Value1({required this.value1,});
  String value1;
}

class TextFieldItem1 extends ItemEvents {
  TextFieldItem1({required this.textItem1,});
  ItemModel textItem1;
}
class TextFieldItem2 extends ItemEvents {
  TextFieldItem2({required this.textItem2,});
  ItemModel textItem2;
}
class TextFieldItem3 extends ItemEvents {
  TextFieldItem3({required this.textItem3,});
  ItemModel textItem3;
}

class SelectItem extends ItemEvents {
  SelectItem({required this.item,});
  ItemModel item;
}

class UnSelectItem extends ItemEvents {
  UnSelectItem({required this.item,});
  ItemModel item;
}

class DeleteItem extends ItemEvents {
  DeleteItem({required this.deleteItem,required this.context,});
  ItemModel deleteItem;
  BuildContext context;
}
class AddItem extends ItemEvents {
  AddItem({required this.addItem, required this.index});
  ItemModel addItem;
  int index;
}
