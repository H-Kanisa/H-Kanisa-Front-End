import 'package:flutter/material.dart';
import '../style/pallete.dart';
import 'DropDown.dart';
import 'constants/constants.dart';

void main() {
  runApp(
    const MaterialApp(
      title: kTitle,
      home: DropDownListExample(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class DropDownListExample extends StatefulWidget {
  const DropDownListExample({
    Key key,
  }) : super(key: key);

  @override
  _DropDownListExampleState createState() => _DropDownListExampleState();
}

class _DropDownListExampleState extends State<DropDownListExample> {
  /// This is list of gender which will pass to the drop down.
  final List<SelectedListItem> _Gender = [
    SelectedListItem(false, Male, value: "Male"),
    SelectedListItem(false, Female, value: "Female")
  ];
  //////
  //////
  //////
  //////
  //////
  //////

  /// This is list of churches which will pass to the drop down.
  final List<SelectedListItem> _Church = [
    SelectedListItem(false, HFC, value: "HFC"),
    SelectedListItem(false, ARK, value: "ARK"),
    SelectedListItem(false, TGL, value: "TGL")
  ];
  //////
  //////
  //////
  //////
  //////
  //////

  /// This is list of churches which will pass to the drop down.
  final List<SelectedListItem> _Cell = [
    SelectedListItem(false, Biazo, value: "Biazo"),
    SelectedListItem(false, Anaedea, value: "Anaedea")
  ];
  //////
  //////
  //////
  //////
  //////
  //////

  /// This is register text field controllers.
  final TextEditingController _dptTextEditingController =
      TextEditingController();
  final TextEditingController _cellTextEditingController =
      TextEditingController();
  final TextEditingController _churchTextEditingController =
      TextEditingController();
  final TextEditingController _genderTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  //////
  //////
  //////
  //////
  //////
  //////
  //////
  //////
  //////

  @override
  void dispose() {
    super.dispose();
    _dptTextEditingController.dispose();
    _cellTextEditingController.dispose();
    _churchTextEditingController.dispose();
    _genderTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }
  //////
  //////
  //////
  //////
  //////
  //////
  //////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: _mainBody(),
      ),
    );
  }

  //////
  //////
  //////
  //////
  //////
  //////
  /// This is Main Body widget.
  Widget _mainBody() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30.0,
          ),
          //////
          //////
          //////
          //////
          //////

          const Text(
            "Register",
            style: TextStyle(
              fontSize: 34.0,
              fontFamily: "Poppins",
              color: AppColor.greenHK,
              fontWeight: FontWeight.bold,
            ),
          ),
          //////
          //////
          //////
          //////

          const SizedBox(
            height: 15.0,
          ),
          //////
          //////
          //////
          //////

          AppTextField(
            textEditingController: _dptTextEditingController,
            title: "Department",
            hint: "Select Department",
            isItemSelected: true,
          ),
          //////
          //////
          //////
          //////
          //////
          //////
          //////

          AppTextField(
            textEditingController: _cellTextEditingController,
            title: "Cell",
            hint: "Select Harvest/Squad/Love group",
            isItemSelected: true,
          ),
          //////
          //////
          //////
          //////
          //////
          //////
          //////
          //////

          AppTextField(
            textEditingController: _churchTextEditingController,
            title: "Church",
            hint: "Select Church",
            isItemSelected: true,
            church: _Church,
          ),
          //////
          //////
          //////
          //////
          //////
          //////
          //////
          //////

          AppTextField(
            textEditingController: _genderTextEditingController,
            title: "Gender",
            hint: "Select Gender",
            isItemSelected: true,
            gender: _Gender,
          ),
          //////
          //////
          //////
          //////
          //////
          AppTextField(
            textEditingController: _passwordTextEditingController,
            title: kPassword,
            hint: kAddYourPassword,
            isItemSelected: false,
          ),
          const SizedBox(
            height: 15.0,
          ),
          _AppElevatedButton(),
        ],
      ),
    );
  }
}

class AppColors {}

// ignore: must_be_immutable, must_be_immutable
//////
//////
//////
//////
//////
//////
//////
//////

/// This is Common App textfiled class.
class AppTextField extends StatefulWidget {
  TextEditingController textEditingController = TextEditingController();
  final String title;
  final String hint;
  //////
  //////
  //////
  //////
  //////
  //////
  //////
  //////

  ///Boolean that checks if any value is selected
  final bool isItemSelected;
  final List<SelectedListItem> gender;
  final List<SelectedListItem> church;
  final List<SelectedListItem> dpt;
  final List<SelectedListItem> cell;
  //////
  //////
  //////
  //////
  //////
  //////
  //////
  //////
  AppTextField({
    this.textEditingController,
    this.title,
    this.hint,
    this.isItemSelected,
    this.gender,
    this.church,
    this.dpt,
    this.cell,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  TextEditingController _searchTextEditingController = TextEditingController();

  ///Display Gender Selected on Textfield
  void onGenderTextFieldTap() {
    DropDownState(
      DropDown(
        submitButtonText: "Done",
        submitButtonColor: AppColor.greenHK,
        searchHintText: "Search",
        bottomSheetTitle: "Gender",
        searchBackgroundColor: AppColor.greyHK,
        dataList: widget.gender ?? [],
        selectedItems: (List<dynamic> selectedList) {
          showGender(selectedList.toString());
        },
        selectedItem: (String selected) {
          showGender(selected);
          widget.textEditingController.text = selected;
        },
        enableMultipleSelection: false,
        searchController: _searchTextEditingController,
      ),
    ).showModal(context);
  }

  void showGender(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  //////
  //////
  //////
  //////
  //////
  //////
  //////
  //////
  ///
  ///Display Church Selected on Textfield
  void onChurchTextFieldTap() {
    DropDownState(
      DropDown(
        submitButtonText: "Done",
        submitButtonColor: AppColor.greenHK,
        searchHintText: "Search",
        bottomSheetTitle: "Church",
        searchBackgroundColor: AppColor.greyHK,
        dataList: widget.church ?? [],
        selectedItems: (List<dynamic> selectedList) {
          showChurch(selectedList.toString());
        },
        selectedItem: (String selected) {
          showChurch(selected);
          widget.textEditingController.text = selected;
        },
        enableMultipleSelection: false,
        searchController: _searchTextEditingController,
      ),
    ).showModal(context);
  }

  void showChurch(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  void onCellTextFieldTap() {
    DropDownState(
      DropDown(
        submitButtonText: "Done",
        submitButtonColor: AppColor.greenHK,
        searchHintText: "Search",
        bottomSheetTitle: "Cell",
        searchBackgroundColor: AppColor.greyHK,
        dataList: widget.cell ?? [],
        selectedItems: (List<dynamic> selectedList) {
          showCell(selectedList.toString());
        },
        selectedItem: (String selected) {
          showCell(selected);
          widget.textEditingController.text = selected;
        },
        enableMultipleSelection: false,
        searchController: _searchTextEditingController,
      ),
    ).showModal(context);
  }

  ///

  ///
  ///
  ///
  void showCell(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  //////
  //////
  //////
  //////
  //////
  //////
  //////
  //////
  void onDepartmentTextFieldTap() {
    DropDownState(
      DropDown(
        submitButtonText: "Done",
        submitButtonColor: AppColor.greenHK,
        searchHintText: "Search",
        bottomSheetTitle: "Church",
        searchBackgroundColor: AppColor.greyHK,
        dataList: widget.dpt ?? [],
        selectedItems: (List<dynamic> selectedList) {
          showDeparment(selectedList.toString());
        },
        selectedItem: (String selected) {
          showDeparment(selected);
          widget.textEditingController.text = selected;
        },
        enableMultipleSelection: false,
        searchController: _searchTextEditingController,
      ),
    ).showModal(context);
  }

  ///
  void showDeparment(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
  //////
  //////
  //////
  //////
  //////
  //////
  //////
  //////

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: AppColor.greyHK,
          onTap: widget.isItemSelected
              ? () {
                  FocusScope.of(context).unfocus();
                  void DropAction(int index) {
                    switch (index) {
                      case 1:
                        onCellTextFieldTap();
                        break;
                      case 2:
                        onChurchTextFieldTap();
                        break;
                      case 3:
                        onDepartmentTextFieldTap();
                        break;
                      case 4:
                        onGenderTextFieldTap();

                        break;
                      default:
                    }
                  }

                  // onChurchTextFieldTap();
                  //onDepartmentTextFieldTap();
                  //onCellTextFieldTap();
                }
              : null,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.greyHK,
            contentPadding:
                const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.hint,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}

///
///
///
///
///
///
/// This is common class for 'REGISTER' elevated button.
class _AppElevatedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60.0,
      child: ElevatedButton(
        onPressed: () {},

        child: const Text(
          "REGISTER",
          style: TextStyle(
              fontSize: 14.0,
              fontFamily: "Poppins",
              fontWeight: FontWeight.normal),
        ),

        ///
        ///
        ///
        ///
        ///
        style: ElevatedButton.styleFrom(
          primary: AppColor.greenHK,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
