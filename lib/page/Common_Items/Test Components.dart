import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../component/appbars/DataTable.dart';
import '../../component/appbars/NavBar.dart';
import '../../style/pallete.dart';
import '../dashboard.dart';
import 'DataSheet_master.dart';

Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Visitation Report',
      color: AppColor.whiteHK,
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
      home: TestComponents(),
    );

class TestComponents extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColor.scaffoldColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColor.whiteHK),
          foregroundColor: AppColor.whiteHK,
          title: Text('Visitation Report'),
          //centerTitle: true,
          backgroundColor: AppColor.BACK_GROUND_COLOR,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              }),
        ),
        body: ListView(children: <Widget>[
          ListTile(
            leading: Icon(Icons.dashboard_customize_rounded),
            title: Text('Data View'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DataViewComponent(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Paginated View'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DataSheet(),
            )),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Expandable Card'),
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
        bottomNavigationBar: NavBar(),
      ),
    );
  }
}
