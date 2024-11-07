import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/pages/login/login_page.dart';
import 'package:udemy_flutter_delivery/src/pages/register/register_page.dart';


void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  @override
  void initState() {
    // TODO: implement initState  (Aqui esdonde se inicia lo primero de la app)
    super.initState();
  }
   //metodo que contruye las vistas
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Deliveri Udemy",
      //Quitar de de demo arriba
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [// En este apartado es donde seteo las rutas para las diferentes paginas de mi app
        GetPage(name: "/", page: () => LoginPage()),
        GetPage(name: "/register", page: () => RegisterPage()),
      ],
      theme: ThemeData(//Se establecen los colores predterminados segun el modelo de movil para cuando se precionan o marcan los text field etc
        primaryColor: Colors.red,//Se define el color primario
        colorScheme: ColorScheme(
            primary: Colors.red,
            brightness: Brightness.dark,
            secondary: Colors.redAccent,
            error: Colors.grey,
            onError: Colors.grey,
            surface: Colors.grey,
            onSurface: Colors.red,
            onPrimary: Colors.red,
            onSecondary: Colors.grey,
        )

      ),
      navigatorKey: Get.key,
    );
  }
}
