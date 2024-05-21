part of 'item_app_bloc.dart';


enum ListStatus {loading, success, failure}

class ItemStates extends Equatable {
  const ItemStates({
    this.itemList = const [],
    this.tempItemList = const [],
    this.listStatus = ListStatus.loading,
    this.value = '',
  });
  final List<ItemModel> itemList;
  final List<ItemModel> tempItemList;
  final String value;
  final ListStatus listStatus;

  ItemStates copyWith({String? value, List<ItemModel>? itemList,List<ItemModel>? tempItemList, ListStatus? listStatus }) {
    return ItemStates(
      itemList: itemList ?? this.itemList,
      tempItemList: tempItemList ?? this.tempItemList,
      listStatus: listStatus ?? this.listStatus,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [itemList, tempItemList, listStatus,value];
}

