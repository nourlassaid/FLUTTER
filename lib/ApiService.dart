import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<Map<String, dynamic>> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erreur de chargement des données');
    }
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erreur de connexion');
    }
  }

  // Ajoutez d'autres méthodes pour d'autres opérations

  // Exemple de méthode pour créer une cagnotte
  Future<void> createCagnotte(String title, double amount, String description) async {
    final response = await http.post(
      Uri.parse('$baseUrl/createCagnotte'),
      body: {
        'title': title,
        'amount': amount.toString(),
        'description': description,
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Erreur lors de la création de la cagnotte');
    }
  }
}
