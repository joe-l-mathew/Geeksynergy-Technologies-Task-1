import 'package:geeksynergy_technologies/db/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDBFunctions {
  Future<void> addUserToDB(UserModel model) async {
    var userBox = await Hive.openBox<UserModel>('users');
    await userBox.add(model);
  }

  Future<UserModel?> checkForUser(
      {required String name, required String password}) async {
    //open box
    var userBox = await Hive.openBox<UserModel>('users');
    //clone db to a list
    List<UserModel> fullUserList = userBox.values.toList();

    //iterate each value for verification
    UserModel? returnVal;
    for (UserModel data in fullUserList) {
      //check for matching profile
      if (data.name == name && data.password == password) {
        returnVal = data;
      }
    }
    fullUserList.clear();
    return returnVal;
  }
}
