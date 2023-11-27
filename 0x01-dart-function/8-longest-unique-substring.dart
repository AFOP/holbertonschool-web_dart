String longestUniqueSubstring(String str) {
  int n = str.length;
  String longestSubstring = "";
  String currentSubstring = "";

  // Mapa para almacenar la última posición de cada carácter en la cadena.
  Map<String, int?> lastSeen = {};

  int start = 0; // Inicio de la subcadena actual.

  for (int end = 0; end < n; end++) {
    String currentChar = str[end];

    // Si el carácter ya está en la subcadena actual,
    // actualizamos el inicio de la subcadena.
    if (lastSeen.containsKey(currentChar) && lastSeen[currentChar]! >= start) {
      start = lastSeen[currentChar]! + 1;
    }

    // Agregamos el carácter a la subcadena actual.
    currentSubstring = str.substring(start, end + 1);

    // Verificamos si la subcadena actual es más larga que la subcadena más larga hasta ahora.
    if (currentSubstring.length > longestSubstring.length) {
      longestSubstring = currentSubstring;
    }

    // Actualizamos la última posición vista del carácter.
    lastSeen[currentChar] = end;
  }

  return longestSubstring;
}
