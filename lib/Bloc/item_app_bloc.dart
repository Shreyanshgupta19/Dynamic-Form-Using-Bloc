import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_4a/model/item_model.dart';
import 'package:flutter_4a/repository/item_repository.dart';

  part 'item_app_event.dart';
  part 'item_app_state.dart';

class ItemBloc extends Bloc<ItemEvents, ItemStates> {

  ItemRepository itemRepository;
  List<ItemModel> itemList = [];
  List<ItemModel> tempItemList = [];

  ItemBloc(this.itemRepository,) : super(const ItemStates()) {
    on<FetchItemList>(fetchList);
    on<Item1>(_addFavouriteItem1);
    on<Item2>(_addFavouriteItem2);
    on<Item3>(_addFavouriteItem3);
    on<TextFieldItem1>(_TextFieldItem1);
    on<TextFieldItem2>(_TextFieldItem2);
    on<TextFieldItem3>(_TextFieldItem3);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);
    on<AddItem>(_addItem);
   // on<Value1>(_Value1);
  }

  // void _Value1(Value1 event, Emitter<FavouriteItemStates> emit) async {
  //   emit(state.copyWith(value: event.value1));
  //   final index = favouriteList.indexWhere((element) => element.id == event.textItem1.id);
  //   final updatedList = state.favouriteItemList.map((item) {
  //     return item.id == event.id ? item.copyWith(textFieldValue1: event.newValue) : item;
  //   }).toList();
  //   emit(state.copyWith(favouriteItemList: updatedList));
  // }

  void _TextFieldItem1(TextFieldItem1 event, Emitter<ItemStates> emit) async {
    final index = itemList.indexWhere((element) => element.id == event.textItem1.id);
    itemList[index] = event.textItem1;
    emit(state.copyWith(itemList: List.from(itemList)));
  }

  void _TextFieldItem2(TextFieldItem2 event, Emitter<ItemStates> emit) async {
    final index = itemList.indexWhere((element) => element.id == event.textItem2.id);
    itemList[index] = event.textItem2;
    emit(state.copyWith(itemList: List.from(itemList)));
  }

  void _TextFieldItem3(TextFieldItem3 event, Emitter<ItemStates> emit) async {
    final index = itemList.indexWhere((element) => element.id == event.textItem3.id);
    itemList[index] = event.textItem3;
    emit(state.copyWith(itemList: List.from(itemList)));
  }


  void fetchList(FetchItemList event, Emitter<ItemStates> emit) async{
    itemList = await itemRepository.fetchItem();
   //  List.from() method is used to create a new list with elements of an existing iterable
    emit(state.copyWith(itemList: List.from(itemList), listStatus: ListStatus.success, ));
   // or
   // emit(state.copyWith(favouriteItemList: favouriteList, listStatus: ListStatus.success, ));   // for the iterable list we use  List.from() method otherwise we can also use for loop

    }


  void _addFavouriteItem1(Item1 event, Emitter<ItemStates> emit) async{
   final index = itemList.indexWhere( (element) => element.id == event.item1.id );

   if(event.item1.isFavourite1) {  // event.item.isFavourite == true
     if(tempItemList.contains(itemList[index])){
       tempItemList.add(event.item1);
     }
   }else{  // event.item.isFavourite == false
     if(tempItemList.contains(itemList[index])){
       tempItemList.add(event.item1);
     }
   }

   itemList[index] = event.item1;

   emit(state.copyWith(itemList: List.from(itemList), tempItemList: List.from(tempItemList)));
  }

  void _addFavouriteItem2(Item2 event, Emitter<ItemStates> emit) async {
    final index = itemList.indexWhere((element) =>
    element.id == event.item2.id);

    if (event.item2.isFavourite2) { // event.item.isFavourite == true
      if (tempItemList.contains(itemList[index])) {
        tempItemList.add(event.item2);
      }
    } else { // event.item.isFavourite == false
      if (tempItemList.contains(itemList[index])) {
        tempItemList.add(event.item2);
      }
    }

    itemList[index] = event.item2;

    emit(state.copyWith(itemList: List.from(itemList), tempItemList: List.from(tempItemList)));
  }

  void _addFavouriteItem3(Item3 event, Emitter<ItemStates> emit) async {
    final index = itemList.indexWhere((element) =>
    element.id == event.item3.id);

    if (event.item3.isFavourite3) { // event.item.isFavourite == true
      if (tempItemList.contains(itemList[index])) {
        tempItemList.add(event.item3);
      }
    } else { // event.item.isFavourite == false
      if (tempItemList.contains(itemList[index])) {
        tempItemList.add(event.item3);
      }
    }

   itemList[index] = event.item3;

   emit(state.copyWith(itemList: List.from(itemList), tempItemList: List.from(tempItemList)));
  }

  void _selectItem(SelectItem event, Emitter<ItemStates> emit) async{
    tempItemList.add(event.item);
    emit(state.copyWith(tempItemList: List.from(tempItemList), ));
  }

  void _unSelectItem(UnSelectItem event, Emitter<ItemStates> emit) async{
    tempItemList.remove(event.item);
    emit(state.copyWith(tempItemList: List.from(tempItemList), ));
  }

  void _deleteItem(DeleteItem event, Emitter<ItemStates> emit) async {

    if (state.itemList.length == state.tempItemList.length ) {
      ScaffoldMessenger.of(event.context).showSnackBar(
        const SnackBar(
          content: Text('Cannot delete all items. At least one item must remain.'),
          duration: Duration(seconds: 2), // Adjust as needed
        ),
      );
      return;
    } if (state.itemList.length > 1) {
      itemList.remove(event.deleteItem);
      tempItemList.remove(event.deleteItem);
      emit(state.copyWith(
        itemList: List.from(itemList),
        tempItemList: List.from(tempItemList),
      ));
    }
  }

  void _addItem(AddItem event, Emitter<ItemStates> emit) async {

    itemList.add(event.addItem);
    tempItemList.add(event.addItem);

    emit(state.copyWith(itemList: List.from(tempItemList)));

  }




}

