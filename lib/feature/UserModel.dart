// class UserModel {
//   final String id;
//   final String firstName;
//   final String middleName;
//   final String lastName;
//   final String phoneNumber;
//   final String birthday;
//   final String loveGroup;
//   final String zone;
//   final String church;
//   final String branch;
//   final String location;
//   const UserModel({
//     this.id,
//     this.firstName,
//     this.middleName,
//     this.lastName,
//     this.phoneNumber,
//     this.birthday,
//     this.loveGroup,
//     this.zone,
//     this.church,
//     this.branch,
//     this.location,
//   });

//   toJson() {
//     return {
//       "firstName": firstName,
//       "middleName": middleName,
//       "lastName": lastName,
//       "phoneNumber": phoneNumber,
//       "birthday": birthday,
//       "loveGroup": loveGroup,
//       "zone": zone,
//       "church": church,
//       "branch": branch,
//       "location": location
//     };
//   }
// }

class UserModel {
  final String id;
  final String firstName;
  final String middleName;
 final String password; 
  const UserModel({
    this.id,
    this.firstName,
    this.middleName,
    this.password, firstname
   
  });

  toJson() {
    return {
      "firstName": firstName,
      "middleName": middleName,
      "password": password
    };
  }
}

