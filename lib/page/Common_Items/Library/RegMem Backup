import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/component/CustomAppBar.dart';
import 'package:responsive_dashboard/component/DropDownText.dart';
import 'package:responsive_dashboard/dashboard.dart';
import 'package:responsive_dashboard/main.dart';
import 'package:responsive_dashboard/page/Common_Items/DataSheet_master.dart';
import 'package:responsive_dashboard/pallete.dart';
import 'package:responsive_dashboard/style/colors.dart';

import '../../../component/DropDown.dart';
import '../../../component/constants.dart';

Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Common_Items',
      color: AppColor.whiteHK,
      theme: ThemeData(
          primarySwatch: AppColor.colorHK,
          scaffoldBackgroundColor: Colors.white),
      home: regMember(),
    );

class regMember extends StatelessWidget {
  get context => null;
  TextEditingController _searchTextEditingController = TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: CustomAppBar(
          title: "Register Member",
          onClickedHome: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) => Dashboard())));
          },
          onClickedBack: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) => DataSheet())));
          }),
      body: SingleChildScrollView(
        child: Container(

            //First Name
            child: Expanded(
          child: FormText(
            hint: "Enter your First Name",
            isItemSelected: true,
            list: _Gender,
            onDrop: () => onTextFieldTap(),
          ),
        )

            //Second Name
            ),
      ),
    ));
  }

  final List<SelectedListItem> _Gender = [
    SelectedListItem(false, "Male", value: "Male"),
    SelectedListItem(false, "Female", value: "Female"),
  ];

  void onTextFieldTap() {
    var widget;
    DropDownState(
      DropDown(
        submitButtonText: kDone,
        submitButtonColor: AppColor.greenHK,
        searchHintText: kSearch,
        bottomSheetTitle: kgender,
        searchBackgroundColor: Colors.black12,
        dataList: widget.gender ?? [],
        selectedItems: (List<dynamic> selectedList) {
          showSnackBar(selectedList.toString());
        },
        selectedItem: (String selected) {
          showSnackBar(selected);
          widget.textEditingController.text = selected;
        },
        enableMultipleSelection: false,
        searchController: _searchTextEditingController,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
