import 'dart:convert';
import '4-util.dart';

Future<double> calculateTotal() async {
  try {
    final userData = await fetchUserData();
    final userId = getUserId(userData);
    final userOrders = await fetchUserOrders(userId);
    final total = await calculateTotalPriceFromMain(userOrders);
    return total;
  } catch (error) {
    return -1; // Retorna -1 en caso de error
  }
}

String getUserId(String userData) {
  return json.decode(userData)["id"];
}

Future<double> calculateTotalPriceFromMain(String userOrders) async {
  final List<String> orders = json.decode(userOrders).cast<String>();

  double total = 0;
  for (final order in orders) {
    final productPrice = await fetchProductPrice(order);
    total += double.parse(productPrice);
  }

  return total;
}
