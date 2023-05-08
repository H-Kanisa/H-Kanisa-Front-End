// main.dart
import 'package:flutter/material.dart';

import '../../page/Common_Items/DataSheet Master/View MemberDetails.dart';
import '../../page/Common_Items/Test Components.dart';
import '../../style/pallete.dart';
import '../Form/FormTitle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      home: DataViewComponent(),
    );
  }
}

class DataViewComponent extends StatefulWidget {
  const DataViewComponent();

  @override
  _DataViewComponentState createState() => _DataViewComponentState();
}

class _DataViewComponentState extends State<DataViewComponent> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Imani", "age": 15},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.all(10).add(EdgeInsets.symmetric(horizontal: 15)),
        child: Column(
          children: [
            Container(
                alignment: Alignment.bottomLeft,
                child: FormTitle(
                    title: "View Members",
                    onClicked: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TestComponents(),
                      ));
                    })),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.lightGreyHk,
                  contentPadding: EdgeInsets.only(left: 40.0, right: 5),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.whiteHK),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColor.whiteHK),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Icon(Icons.search, color: AppColor.textGreyHK),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: AppColor.textGreyHK,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w300,
                      fontSize: 14)),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundUsers[index]["id"]),
                        color: AppColor.whiteHK,
                        elevation: 1,
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        child: ListTile(
                          leading: Text(
                            _foundUsers[index]["id"].toString(),
                            style: const TextStyle(
                                color: AppColor.redHK,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 17),
                          ),
                          title: Text(
                            _foundUsers[index]['name'],
                            style: TextStyle(
                                color: AppColor.greyHK,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => viewMembersDetails(),
                          )),
                          subtitle: Text(
                            '${_foundUsers[index]["age"].toString()} years old',
                            style: TextStyle(
                                color: AppColor.greyHK,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: 13),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
