import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class RegChild extends StatefulWidget {
  @override
  _RegChildState createState() => _RegChildState();
}

class _RegChildState extends State<RegChild> {
  final _formKey = GlobalKey<FormState>();

  String _firstName;
  String _middleName;
  String _lastName;
  String _phoneNumber;
  String _birthday;
  String _loveGroup;
  String _zone;
  String _church;
  String _branch;
  String _location;

  Future<void> _submitForm() async {
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: '',
      db: 'h-kanisa',
    );

    final conn = await MySqlConnection.connect(settings);

    await conn.query(
      'INSERT INTO member_registration (FName, MName, LName, Phone_Number, DOB, Love_Group, Zone, Church, Branch, City) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [
        _firstName,
        _middleName,
        _lastName,
        _phoneNumber,
        _birthday,
        _loveGroup,
        _zone,
        _church,
        _branch,
        _location,
      ],
    );

    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _firstName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Middle Name'),
                onSaved: (value) {
                  _middleName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _lastName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phoneNumber = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date of Birth'),
                onSaved: (value) {
                  _birthday = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Love Group'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your love group';
                  }
                  return null;
                },
                onSaved: (value) {
                  _loveGroup = value;
                },
              ),
              ElevatedButton(
                child: Text('Submit'),
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
