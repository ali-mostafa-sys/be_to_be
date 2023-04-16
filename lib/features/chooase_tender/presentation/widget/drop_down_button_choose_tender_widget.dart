import 'package:be_to_be/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class DropDownButtonChooseTenderWidget extends StatelessWidget {
  DropDownButtonChooseTenderWidget(
      {Key? key,
      required this.items,
      required this.searchHint,
      required this.buttonText,
      required this.onChange})
      : super(key: key);

  List<MultiSelectItem<dynamic>> items;
  String searchHint;
  String buttonText;
  Function(List) onChange;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double containerHeight = w * 0.1;
    double sizedBoxHeight = h * 0.01;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.1),
      child: MultiSelectDialogField(
        items: items
        //choBloc.categoriesEntity.map((e) => MultiSelectItem(e, e.nameEn)).toList()
        ,
        onConfirm: onChange
        //     (List<CategoriesChooseTenderEntity> n) {
        //   print(n);
        // }
        ,
        listType: MultiSelectListType.CHIP,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: HexColor('#DCDCDC'),
          border: Border.all(
              color: primaryColor, width: 1, style: BorderStyle.solid),
        ),
        backgroundColor: HexColor('#DCDCDC'),
        selectedColor: primaryColor.withOpacity(0.3),
        searchHint: searchHint,
        searchHintStyle: TextStyle(fontSize: w * 0.03),
        searchable: true,
        title: Text(searchHint,
            style: TextStyle(color: primaryColor, fontSize: w * 0.03)),
        buttonText: Text(
          buttonText,
          style: TextStyle(color: primaryColor),
        ),
        buttonIcon: Icon(
          Icons.keyboard_arrow_down_sharp,
          color: primaryColor,
          size: w * 0.07,
        ),
        dialogHeight: h * 0.2,
        dialogWidth: w * 0.4,
      ),
    );
  }
}
