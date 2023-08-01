import 'data_user_modal.dart';

class DataModal {
  final List<DataUserModal> listUser;

  DataModal({required this.listUser});

  static DataModal fromJson(Map<String, dynamic> json) =>
      DataModal(listUser: json['users']);

   Map<String,dynamic> toJson() => {
    'users':listUser
  };

   Map<String,dynamic> toMap(){
     return {
       'users' : listUser
     };
   }

   DataModal.fromMap(Map<String,dynamic> dataModal):listUser=dataModal['users'];
}
