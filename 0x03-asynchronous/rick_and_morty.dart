import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> printRmCharacters() async {
  try {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    
    if (response.statusCode == 200) {
      final List<dynamic> characters = json.decode(response.body)['results'];
      
      for (final character in characters) {
        print(character['name']);
      }
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    print('error caught: $error');
  }
}
