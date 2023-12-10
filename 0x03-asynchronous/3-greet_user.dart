import '3-util.dart';

Future<String> greetUser() async {
  try {
    final userData = await fetchUserData();
    final username = getUsername(userData);
    return 'Hello $username';
  } catch (error) {
    return 'error caught: $error';
  }
}

String getUsername(String userData) {
  // Aquí deberías tener la lógica para extraer el nombre de usuario del JSON
  // Por ahora, simplemente devolvemos el nombre de usuario sin procesar
  return userData.split('"username" : "')[1].split('"')[0];
}

Future<String> loginUser() async {
  try {
    final credentialsValid = await checkCredentials();
    print('There is a user: $credentialsValid');

    if (credentialsValid) {
      final greeting = await greetUser();
      return greeting;
    } else {
      return 'Wrong credentials';
    }
  } catch (error) {
    return 'error caught: $error';
  }
}
