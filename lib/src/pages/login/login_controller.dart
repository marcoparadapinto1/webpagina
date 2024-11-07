import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
//Esta clase es la que rutea o nombra de cirta fomrma al las paginas que quiero cambiar o acceder
class LoginController extends GetxController{
//Con esto campturaremos los valores que el usuario ingrese
//
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void goToRegisterPage (){//Recuerda no poner o anteponer _ ya que esto lo dejaria como privado impidiendo su uso desde otro lugar
    Get.toNamed("/register");
  }
  //Metodo que disparara al servidor para validar la base de datos
  void login(){
    //Capturamos con un string los datos que ingrese el usuario
    String email = emailController.text.trim();//El metodo trim es para que no permita bits vacios es decir no aceptara el espacio como dato
    String password = passwordController.text.trim();
  //Para mostrar en pantalla (Consola) lo que ponga el usuario
    print("email${email}");
    print("password${password}");


    if (isValidForm(email, password)){
      Get.snackbar("Formualrio valido", "Estas listo para enviar la peticion http");
    }

  }
  //Crearemos un metodo que retone un booleano que preguntara si el form es valido obtendremos por paramotro los 2 string
  bool  isValidForm(String email,String password){
    if (email.isEmpty){//Si el email esta vacio entonces
      Get.snackbar("Fomulario no valido", "Debes ingrear el Email");
      return false;//Retornamos false despues de mostrado el mensaje
    }
    if (!GetUtils.isEmail(email)){//Esta condicion viene de Get y valida si el campo es de tipo email por ejemplo con la pregunta "Si no es un email el campo email entonces..."
      Get.snackbar("Formulario no valido", "EL email no es valido");
      return false;//Retornamos false despues de mostrado el mensaje
    }
    if (password.isEmpty){//Si el email esta vacio entonces
      Get.snackbar("Fomulario no valido", "Debes ingrear el password");
      return false;//Retornamos false despues de mostrado el mensaje
    }
    return true;
  }

}