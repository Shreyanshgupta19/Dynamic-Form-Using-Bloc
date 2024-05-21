import 'package:flutter/material.dart';
import 'package:flutter_4a/Bloc/item_app_bloc.dart';
import 'package:flutter_4a/Widgets/CustomButton.dart';
import 'package:flutter_4a/Widgets/CustomColor.dart';
import 'package:flutter_4a/Widgets/CustomTextField.dart';
import 'package:flutter_4a/model/item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormAppScreen extends StatefulWidget {
  const FormAppScreen({super.key});

  @override
  State<FormAppScreen> createState() => _FormAppScreenState();
}

class _FormAppScreenState extends State<FormAppScreen> {
  int counter = 0;

  void _click1(ItemModel item) {
    ItemModel itemModel = ItemModel(
      id: item.id,
      value: item.value,
      isFavourite1: !item.isFavourite1,
    );
    context.read<ItemBloc>().add(Item1(item1: itemModel));
  }

  void _click2(ItemModel item) {
    ItemModel itemModel = ItemModel(
      id: item.id,
      value: item.value,
      isFavourite2: !item.isFavourite2,
    );
    context.read<ItemBloc>().add(Item2(item2: itemModel));
  }

  void _click3(ItemModel item) {
    ItemModel itemModel = ItemModel(
      id: item.id,
      value: item.value,
      isFavourite3: !item.isFavourite3,
    );
    context.read<ItemBloc>().add(Item3(item3: itemModel));
  }

  @override
  void initState() {
    super.initState();
    context.read<ItemBloc>().add(FetchItemList());
  }

  @override
  Widget build(BuildContext context) {
    late double screenWidth;
    late double screenHeight;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    double radius =
        screenWidth < screenHeight ? screenWidth * 0.002 : screenHeight * 0.002;
    final List<String> text = ['Label', 'Info Text'];
    final List<String> hintText = ['Add label', 'Add additional info'];
    final List<String> settingsText = ['Required', 'Readonly', 'Hidden Field'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<ItemBloc, ItemStates>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ListStatus.failure:
                return const Center(
                  child: Text('Something went wrong'),
                );
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.itemList.length,
                  itemBuilder: (context, index) {
                    final item = state.itemList[index];
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: screenWidth * 0.02,
                          bottom: screenWidth * 0.001,
                          right: screenWidth * 0.01,
                          left: screenWidth * 0.01,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomButton.customizedElevatedButton(
                                  context: context,
                                  text: "Remove",
                                  radius: radius,
                                  color: CustomColors.white,
                                  textColor: CustomColors.darkBlack,
                                  textSize: screenHeight * 0.017,
                                  height: screenHeight * 0.04,
                                  width: screenWidth * 0.19,
                                  onPressedFunc: () {
                                    context
                                        .read<ItemBloc>()
                                        .add(SelectItem(item: item));
                                    context
                                        .read<ItemBloc>()
                                        .add(DeleteItem(deleteItem: item, context: context));
                                  },
                                ),
                                SizedBox(width: screenWidth * 0.008),
                                CustomButton.customizedElevatedButton(
                                  context: context,
                                  text: "Done",
                                  radius: radius,
                                  color: CustomColors.accentBlue,
                                  textColor: CustomColors.white,
                                  textSize: screenHeight * 0.017,
                                  height: screenHeight * 0.04,
                                  width: screenWidth * 0.16,
                                  onPressedFunc: () {
                                    context
                                        .read<ItemBloc>()
                                        .add(SelectItem(item: item));
                                    context.read<ItemBloc>().add(AddItem(
                                        addItem: ItemModel(
                                            id: '${index + 1}',
                                            value: 'text${index + 1}'),
                                        index: index));
                                  },
                                ),
                                SizedBox(width: screenWidth * 0.008),
                              ],
                            ),
                            for (int i = 0; i < text.length; i++) ...[
                              Padding(
                                padding: EdgeInsets.only(
                                  top: screenWidth * 0.04,
                                  bottom: screenWidth * 0.001,
                                  left: screenWidth * 0.01,
                                ),
                                child: Text(
                                  text[i],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: screenHeight * 0.02,
                                  ),
                                ),
                              ),
                              CustomTextField.customTextField(
                                context: context,
                                text: hintText[i],
                                imageIcon: '',
                                obscuretext: false,
                                maxLengths: 1,
                                textfieldHeight: screenHeight * 0.06,
                                insideText: screenHeight * 0.02,
                                textfieldWidth: screenWidth * 0.7,
                                radius: radius,
                                keyboardtype: TextInputType.text,
                                onChangedFunc: (value) {
                                  if (i == 0) {
                                    final newItem =
                                        item.copyWith(textFieldValue1: value);
                                    context.read<ItemBloc>().add(
                                        TextFieldItem1(textItem1: newItem));
                                  } else if (i == 1) {
                                    final newItem =
                                        item.copyWith(textFieldValue2: value);
                                    context.read<ItemBloc>().add(
                                        TextFieldItem2(textItem2: newItem));
                                  }
                                },
                              ),
                            ],
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenWidth * 0.04,
                                bottom: screenWidth * 0.008,
                                left: screenWidth * 0.01,
                              ),
                              child: Text(
                                'Settings',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: screenHeight * 0.02,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenWidth * 0.001,
                                bottom: screenWidth * 0.001,
                                left: screenWidth * 0.01,
                              ),
                              child: BlocBuilder<ItemBloc, ItemStates>(
                                builder: (context, state) {
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        for (int i = 0;
                                            i < settingsText.length;
                                            i++) ...[
                                          if (state.itemList
                                              .isNotEmpty)
                                            Row(
                                              children: [
                                                Checkbox(
                                                  value: i == 0
                                                      ? item.isFavourite1
                                                      : i == 1
                                                          ? item.isFavourite2
                                                          : item.isFavourite3,
                                                  onChanged: (newValue) {
                                                    if (newValue != null) {
                                                      if (i == 0) {
                                                        _click1(item);
                                                      } else if (i == 1) {
                                                        _click2(item);
                                                      } else if (i == 2) {
                                                        _click3(item);
                                                      }
                                                    }
                                                  },
                                                ),
                                                Text(
                                                  settingsText[i],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize:
                                                        screenHeight * 0.017,
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );

                    //    Card(
                    //   child: SizedBox(
                    //     height: 400,
                    //     child: ListTile(
                    //       leading: IconButton(
                    //         onPressed: () {
                    //           context.read<ItemBloc>().add(SelectItem(item: item));
                    //           context.read<ItemBloc>().add(AddItem(addItem: ItemModel(id: '${index + 1}', value: 'text${index+1}'),index: index));
                    //         },
                    //         icon: const Icon(Icons.add),
                    //       ),
                    //       trailing: IconButton(
                    //         onPressed: () {
                    //           context.read<ItemBloc>().add(SelectItem(item: item));
                    //           context.read<ItemBloc>().add(DeleteItem(deleteItem: item));
                    //         },
                    //         icon: const Icon(Icons.delete),
                    //       ),
                    //       title: Column(
                    //         children: [
                    //           Text(counter.toString()),
                    //           TextFormField(
                    //             initialValue: item.textFieldValue1,
                    //             onChanged: (value) {
                    //               final newItem = item.copyWith(textFieldValue1: value);
                    //               context.read<ItemBloc>().add(Value1(value1: newItem.textFieldValue1.toString()));
                    //               context.read<ItemBloc>().add(TextFieldItem1(textItem1: newItem));
                    //             },
                    //           ),
                    //           TextFormField(
                    //             initialValue: item.textFieldValue2,
                    //             onChanged: (value) {
                    //               final newItem = item.copyWith(textFieldValue2: value);
                    //               context.read<ItemBloc>().add(TextFieldItem2(textItem2: newItem));
                    //             },
                    //           ),
                    //           TextFormField(
                    //             initialValue: item.textFieldValue3,
                    //             onChanged: (value) {
                    //               final newItem = item.copyWith(textFieldValue3: value);
                    //               context.read<ItemBloc>().add(TextFieldItem3(textItem3: newItem));
                    //             },
                    //           ),
                    //           Checkbox(
                    //             value: item.isFavourite1,
                    //             onChanged: (value) {
                    //               _click1(item);
                    //             },
                    //           ),
                    //           Checkbox(
                    //             value: item.isFavourite2,
                    //             onChanged: (value) {
                    //               _click2(item);
                    //             },
                    //           ),
                    //           Checkbox(
                    //             value: item.isFavourite3,
                    //             onChanged: (value) {
                    //               _click3(item);
                    //             },
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
