import 'package:get_storage/get_storage.dart';

class AppLocalStorage{
  static final AppLocalStorage _instance = AppLocalStorage._internal();

  factory AppLocalStorage(){
    return _instance;
  }
  
  AppLocalStorage._internal();
  // Generic Method to save data
  Future<void> saveData(String key, dynamic value) async{
    await GetStorage().write(key, value);
  }

  // Generic Method to read data
  Future<dynamic> readData(String key) async{
    return await GetStorage().read(key);
  }

  // Generic Method to remove data
  Future<void> removeData(String key) async{
    await GetStorage().remove(key);
  }

  // Generic Method to clear data
  Future<void> clearData() async{
    await GetStorage().erase();
  }

}