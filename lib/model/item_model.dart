import 'package:equatable/equatable.dart';
class ItemModel extends Equatable {
  const ItemModel({
    required this.id,
    required this.value,
    this.isDeleting = false,
    this.isFavourite1 = false,
    this.isFavourite2 = false,
    this.isFavourite3 = false,
    this.textFieldValue1 = '',
    this.textFieldValue2 = '',
    this.textFieldValue3 = '',
  });

  final String id;
  final String value;
  final String textFieldValue1;
  final String textFieldValue2;
  final String textFieldValue3;
  final bool isDeleting;
  final bool isFavourite1;
  final bool isFavourite2;
  final bool isFavourite3;

  ItemModel copyWith({
    String? id,
    String? value,
    bool? isDeleting,
    bool? isFavourite1,
    bool? isFavourite2,
    bool? isFavourite3,
    String? textFieldValue1,
    String? textFieldValue2,
    String? textFieldValue3,
  }) {
    return ItemModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isDeleting: isDeleting ?? this.isDeleting,
      isFavourite1: isFavourite1 ?? this.isFavourite1,
      isFavourite2: isFavourite2 ?? this.isFavourite2,
      isFavourite3: isFavourite3 ?? this.isFavourite3,
      textFieldValue1: textFieldValue1 ?? this.textFieldValue1,
      textFieldValue2: textFieldValue2 ?? this.textFieldValue2,
      textFieldValue3: textFieldValue3 ?? this.textFieldValue3,
    );
  }

  @override
  List<Object?> get props => [
    id,
    value,
    isDeleting,
    isFavourite1,
    isFavourite2,
    isFavourite3,
    textFieldValue1,
    textFieldValue2,
    textFieldValue3,
  ];
}
