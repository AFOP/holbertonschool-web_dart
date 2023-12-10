import '2-util.dart';

Future<void> getUser() async {
  try {
    final userData = await fetchUser();
    print(userToString(userData));
  } catch (error) {
    print('error caught: $error');
  }
}

String userToString(String userData) {
  // Aquí deberías tener la lógica para convertir el JSON en la representación de cadena del usuario
  // Por ahora, simplemente devolvemos el JSON sin procesar
  return userData;
}
