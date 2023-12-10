import '1-util.dart';

Future<String> getUserId() async {
  final userData = await fetchUserData();
  // Parse el JSON y devuelve el ID del usuario
  return userIdFromJson(userData);
}

String userIdFromJson(String userData) {
  // Simplemente parsea el JSON y extrae el ID del usuario
  return userData.split('"id" : "')[1].split('"')[0];
}
