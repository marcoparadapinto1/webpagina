/*import 'dart:convert'; // Para convertir a JSON
import 'dart:html' as html; // Para utilizar la API fetch

// Función para hacer la solicitud POST
Future<void> registerUser(String email, String password, String name, String lastName, String phone, String image) async {
  // Crear el cuerpo de la solicitud
  final Map<String, String> body = {
    'email': email,
    'password': password,
    'name': name,
    'lastName': lastName,
    'phone': phone,
    'image': image
  };

  try {
    // Realizar la solicitud fetch
    final response = await html.window.fetch(
        Uri.parse('http://localhost:5000/api/users/create').toString(), // Asegúrate de usar la URL correcta
        html.Request('POST', body: json.encode(body), headers: {
          'Content-Type': 'application/json'
        })
    );

    if (response.ok) {
      // Si la respuesta es exitosa, procesamos la respuesta
      final responseBody = await response.text();
      print('Usuario creado exitosamente: $responseBody');
    } else {
      // Si la respuesta es un error
      final errorBody = await response.text();
      print('Error al crear usuario: $errorBody');
    }
  } catch (e) {
    print('Error al realizar la solicitud: $e');
  }
}