import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard/main.dart';
import 'package:responsive_dashboard/page/Common_Items/DataSheet_master.dart';
import 'package:responsive_dashboard/style/pallete.dart';

Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Common_Items',
      color: AppColor.whiteHK,
      theme: ThemeData(primarySwatch: AppColor.colorHK),
    );

class manageViews extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColor.whiteHK),
          foregroundColor: AppColor.whiteHK,
          title: Text('Manage Access Views'),
          //centerTitle: true,
          backgroundColor: AppColor.BACK_GROUND_COLOR,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyApp()));
              }),
        ),
        body: ListView(children: <Widget>[
          ListTile(
            leading: Icon(Icons.dashboard_customize_rounded),
            title: Text('Register Visitor'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DataSheet(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Record Temperature'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DataSheet(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Register Member'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DataSheet(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('View Members'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DataSheet(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Register Child'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DataSheet(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Drop Child'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DataSheet(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Pick Child'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DataSheet(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.add_box_outlined),
            title: Text('Visitation'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DataSheet(),
            )),
          ),
        ]),
      ),
    );
  }
}
