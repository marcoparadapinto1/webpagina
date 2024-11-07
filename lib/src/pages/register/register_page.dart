import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:udemy_flutter_delivery/src/pages/register/register_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(//Para poscionar encima del otro
        children: [
          _backgoundCover(context),
          _boxForm(context),
          _imageUser(),
          _buttonBack()
        ],
      ),
    );
  }
  //Widget para el box donde se ingresan los datos
  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3,left: 50,right: 50),// Con esto nuevamente se establece que el mangen sera por medio de porcentage y no de pixeles para evitar que en moviles mas grandes o mas pequeños se mantengan las proporciones
      decoration: BoxDecoration(//Se hace para dar un color al BOX de aplicaciones
          color: Colors.white,//Se define el color del box
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,//Color de la sombra
                blurRadius: 15,//Cantidad de radio de desenfocque
                offset: Offset(0,0.75)//Se define cuanto se desplaza la sombra
            )
          ]
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _txtTitle(),
            _txtUser(),
            _txtName(),
            _txtLastName(),
            _txtPhone(),
            _txtpass(),
            _txtpassConfirm(),
            _btnRegister()
          ],
        ),
      ),
    );
  }
  //Wisget para el color de fondo
  Widget _backgoundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      //Con esto aseguramos el resposive segun l pantlla y no trabajar directo con pixles
      color: Colors.red,
    );
  }
  //Widget para el text fiel (Cuadro de texto dinamico) donde esl usuari ingresa su correo o User
  Widget _txtUser (){//En este caso este representa el correo
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller.emailController,
        keyboardType: TextInputType.emailAddress,//Determina como se comporta el teclado segun el dato que pondra el usuario en este caso sera un correo por lo que se hace esto para que aparezca el @ de una en el teclado
        decoration: InputDecoration(
            hintText: "Correo electronico", //Seria el equivalente al Place holder es decir el texto en gris que aparece como guia en un campo de texto o text field
            prefixIcon: Icon(Icons.email)
        ),
      ),
    );
  }
  Widget _txtName (){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller.nameController,
        keyboardType: TextInputType.text,//Determina como se comporta el teclado segun el dato que pondra el usuario en este caso sera un correo por lo que se hace esto para que aparezca el @ de una en el teclado
        decoration: InputDecoration(
            hintText: "Nombre", //Seria el equivalente al Place holder es decir el texto en gris que aparece como guia en un campo de texto o text field
            prefixIcon: Icon(Icons.person)
        ),
      ),
    );
  }
  Widget _txtLastName (){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller.lastNameController,
        keyboardType: TextInputType.text,//Determina como se comporta el teclado segun el dato que pondra el usuario en este caso sera un correo por lo que se hace esto para que aparezca el @ de una en el teclado
        decoration: InputDecoration(
            hintText: "Apellido", //Seria el equivalente al Place holder es decir el texto en gris que aparece como guia en un campo de texto o text field
            prefixIcon: Icon(Icons.person_2_outlined)
        ),
      ),
    );
  }
  Widget _txtPhone (){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller.phoneController,
        keyboardType: TextInputType.phone,//Determina como se comporta el teclado segun el dato que pondra el usuario en este caso sera un para un numero de telefono por lo que se hace esto para que aparezca el @ de una en el teclado
        decoration: InputDecoration(
            hintText: "Numero de Telefono", //Seria el equivalente al Place holder es decir el texto en gris que aparece como guia en un campo de texto o text field
            prefixIcon: Icon(Icons.phone)
        ),
      ),
    );
  }
  //Widget para el text fiel (Cuadro de texto dinamico) donde esl usuari ingresa su correo o User
  Widget _txtpass (){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller.passwordController,
        obscureText: true,//Hace que la clave no sea visible en primera instancia para hacer mas seguro su ingreso
        keyboardType: TextInputType.text,//Determina como se comporta el teclado segun el dato que pondra el usuario
        decoration: InputDecoration(
            hintText: "Contraseña", //Seria el equivalente al Place holder es decir el texto en gris que aparece como guia en un campo de texto o text field
            prefixIcon: Icon(Icons.lock)
        ),
      ),
    );
  }
  Widget _txtpassConfirm (){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: controller.confirmPasswordController,
        obscureText: true,//Hace que la clave no sea visible en primera instancia para hacer mas seguro su ingreso
        keyboardType: TextInputType.text,//Determina como se comporta el teclado segun el dato que pondra el usuario
        decoration: InputDecoration(
            hintText: "Confirma tu Contraseña", //Seria el equivalente al Place holder es decir el texto en gris que aparece como guia en un campo de texto o text field
            prefixIcon: Icon(Icons.lock_clock_outlined)
        ),
      ),
    );
  }
  Widget _imageUser() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: (){},
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/img/user_profile.png"),
          radius: 60,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
  Widget _buttonBack(){
    return SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20),
          child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 30,
              ),


          ),
        )
    );
  }
  //Widget para el text titulo de ingresa esta onfo (titulo del bos donde se piden los datos)
  Widget _txtTitle() {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 15),
      child: Text(
        "Datos para el registro",
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
      ),
    );
  }
  //Widget para usar la imagen y dimencionarla
  Widget _imageCover() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 15),
        alignment: Alignment.topCenter,
        child: Image.asset(
          "assets/img/delivery.png",
          width: 130,
          height: 130,
        ),
      ),
    );
  }
  //Widget para el boton de login
  Widget _btnRegister (){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40,vertical: 40),
      child: ElevatedButton(//Este evento hara que el boton tenga dinamismoen sus estados, por ejemplo precionar etc
          onPressed: () => controller.register(),//Este evento es el que gatilla por medio de pulsaciones (Es como el onclick en kotlin) en este caso lo declaramos como funcion vacia con los parentesis vacios
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              padding: EdgeInsets.symmetric(vertical: 15)
          ),
          child: Text(
            "Registrate",
            style: TextStyle(
                color: Colors.black
            ),
          )
      ),
    );
  }
  //Widget para el texto bajo la imagen
  Widget _textAppName() {
    return Text(
      "Delivery",
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}
