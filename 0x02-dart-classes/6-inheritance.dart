// Importa la clase Password desde 6-password.dart
import '6-password.dart';

class User {
  int id;
  String name;
  int age;
  double height;
  Password user_password;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.height,
    required dynamic user_password,
  }) : user_password = _createPassword(user_password);

  // Nuevo constructor para inicialización sin modificar main
  User.init()
      : id = 0,
        name = '',
        age = 0,
        height = 0,
        user_password = Password(value: '');

  // Nuevo método para inicialización desde un mapa
  User.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] ?? 0,
        name = json['name'] ?? '',
        age = json['age'] ?? 0,
        height = json['height'] ?? 0.0,
        user_password = _createPassword(json['user_password']);

  static Password _createPassword(dynamic value) {
    if (value is Password) {
      return value;
    } else if (value is String) {
      return Password(value: value);
    } else {
      // Si no es una cadena ni una instancia de Password, crea una instancia con un valor vacío
      return Password(value: '');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'height': height,
      'user_password': user_password.value,
    };
  }

  @override
  String toString() {
    return 'Usuario(id : $id ,nombre: $name, edad: $age, altura: $height, ${user_password})';
  }
}
