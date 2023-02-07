import 'package:be_to_be/core/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';




class DropDownButtonCreateWidget extends StatelessWidget {
   DropDownButtonCreateWidget({Key? key,required this.selected,required this.hintText,required this.items,required this.onChanged}) : super(key: key);

   String? selected;
   String hintText;
   List<DropdownMenuItem<String>>? items;
   Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsetsDirectional.only(
          start: w * 0.02),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              width: 1, color: primaryColor),
          color: HexColor('#DCDCDC')),
      child: DropdownButton(
          borderRadius: BorderRadius.circular(25),
          // key: companyId,
          // alignment: Alignment.bottomCenter,
          underline: Container(
            width: 0,
            height: 0,
          ),
          dropdownColor: HexColor('#DCDCDC'),
          menuMaxHeight: h * 0.3,
          isExpanded: true,
          isDense: false,
          value: selected,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: primaryColor,
            size: w * 0.1,
          ),
          elevation: 16,
          hint: Text(
            hintText,
            style: TextStyle(color: primaryColor),
          ),
          style: TextStyle(color: primaryColor),
          onChanged:onChanged
            // (String? newValue) {
            //newValue=cubits.countryLanguage;

            // bloc.add(
            //     SelectedValueForDropDownButtonEvent(
            //         selectedValue: newValue!));
         // }
          ,
          items: items,
      )
    );
  }
}









