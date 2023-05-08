// main.dart
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/page/Common_Items/DataSheet%20Master/Register%20Member.dart';
import 'package:responsive_dashboard/page/Common_Items/DataSheet_master.dart';
import 'package:responsive_dashboard/page/Common_Items/Test%20Components.dart';
import 'package:responsive_dashboard/page/Setup/Add%20Church.dart';

import '../../../component/form/CustomButton.dart';
import '../../../component/Form/FormTitle.dart';
import '../../../style/pallete.dart';
import 'View MemberDetails.dart';

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
      home: viewMembers(),
    );
  }
}

class viewMembers extends StatefulWidget {
  const viewMembers();

  @override
  _viewMembersState createState() => _viewMembersState();
}

class _viewMembersState extends State<viewMembers> {
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
                        builder: (context) => DataSheet(),
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
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: PhysicalModel(
                          clipBehavior: Clip.none,
                          color: AppColor.lightGreyHk,
                          borderRadius: BorderRadius.circular(15),
                          child: ListTile(
                            key: ValueKey(_foundUsers[index]["id"]),
                            title: ExpansionTile(
                              leading: Transform.translate(
                                offset: Offset(-8, 2),
                                child: Text(
                                  _foundUsers[index]["id"].toString(),
                                  style: const TextStyle(
                                      color: AppColor.redHK,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                              ),
                              title: Transform.translate(
                                offset: Offset(-30, -4),
                                child: Text(
                                  _foundUsers[index]['name'],
                                  style: TextStyle(
                                      color: AppColor.greyHK,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                              ),
                              /*
                        onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => viewMembersDetails(),
                              )),
                        */
                              subtitle: Transform.translate(
                                  offset: Offset(-30, 0),
                                  child: Text(
                                    '${_foundUsers[index]["age"].toString()} years old',
                                    style: TextStyle(
                                        color: AppColor.greyHK,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12),
                                  )),
                              children: <Widget>[
                                ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.all(2.0).add(
                                          EdgeInsets.symmetric(horizontal: 18)),
                                      child: Column(
                                        verticalDirection:
                                            VerticalDirection.down,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Name: ',
                                                      style: TextStyle(
                                                          color:
                                                              AppColor.greyHK,
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12),
                                                    ),
                                                    Text(
                                                      _foundUsers[index]
                                                          ['name'],
                                                      style: TextStyle(
                                                          color:
                                                              AppColor.greyHK,
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'ID: ',
                                                      style: TextStyle(
                                                          color:
                                                              AppColor.greyHK,
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12),
                                                    ),
                                                    Text(
                                                      _foundUsers[index]['id']
                                                          .toString(),
                                                      style: TextStyle(
                                                          color:
                                                              AppColor.greyHK,
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12),
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Birthday: ',
                                                      style: TextStyle(
                                                          color:
                                                              AppColor.greyHK,
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12),
                                                    ),
                                                    Text(
                                                      ' ${_foundUsers[index]['age']} years old',
                                                      style: TextStyle(
                                                          color:
                                                              AppColor.greyHK,
                                                          fontFamily: "Poppins",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    subtitle: Transform.translate(
                                      offset: Offset(12, 0),
                                      child: Row(
                                        children: [
                                          /*
                                          InkWell(
                                            splashColor: AppColor.redHK,
                                            onTap: () => Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) => addChurch(),
                                            )),
                                            child: IconButton(
                                              icon: Icon(Icons.person),
                                              color: AppColor.greyHK,
                                              iconSize: 20,
                                              constraints: BoxConstraints(),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: AppColor.redHK,
                                            onTap: () => Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) => addChurch(),
                                            )),
                                            child: IconButton(
                                              icon: Icon(Icons.place),
                                              color: AppColor.greyHK,
                                              iconSize: 20,
                                              constraints: BoxConstraints(),
                                            ),
                                          ),*/
                                          Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: PhysicalModel(
                                                color: AppColor.blueSubtleHK,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(7.0),
                                                  child: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () => Navigator
                                                                .of(context)
                                                            .push(
                                                                MaterialPageRoute(
                                                          builder: (context) =>
                                                              regMember(),
                                                        )),
                                                        child: Container(
                                                            height: 11,
                                                            width: 55,
                                                            child: Center(
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .person,
                                                                    size: 15,
                                                                    color: AppColor
                                                                        .blueHK,
                                                                  ),
                                                                  Text(
                                                                    'Profile',
                                                                    style: TextStyle(
                                                                        color: AppColor
                                                                            .blueHK,
                                                                        fontFamily:
                                                                            "Poppins",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w700,
                                                                        fontSize:
                                                                            10),
                                                                  ),
                                                                ],
                                                              ),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                          ),
                                          PhysicalModel(
                                              color: AppColor.redSubtleHK,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(7.0),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () => Navigator.of(
                                                              context)
                                                          .push(
                                                              MaterialPageRoute(
                                                        builder: (context) =>
                                                            regMember(),
                                                      )),
                                                      child: Container(
                                                          height: 11,
                                                          width: 65,
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .place_rounded,
                                                                  size: 15,
                                                                  color: AppColor
                                                                      .redHK,
                                                                ),
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: AppColor
                                                                          .redHK,
                                                                      fontFamily:
                                                                          "Poppins",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                    ),
                                                  ],
                                                ),
                                              ))
                                        ],
                                      ),
                                    )),
                              ],
                            ),
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
