import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent,
            title : Text("Perfil de Usuario")
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Cabezera(userName:"Nombre Usuario",backgroundAssets:"assets/fondo.jpg",userAssets:"assets/usuario.jpg"),
            Container(
              color: Color.fromARGB(50,0,100,0),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Conexion(tipo: "seguidores",cantidad: "300",),
                  Conexion(tipo: "seguidos",cantidad: "500",),
                ],
              ),
            ),
            Descripcion(text:"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "),
          ],
        ),
      ),
    );
  }
}

class Usuario extends StatelessWidget{///Stless para crear una clase
  final String assetsImage;
  final double size;

  const Usuario({Key key,@required this.assetsImage,this.size}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetsImage),
            fit: BoxFit.cover,
          ),
          shape:  BoxShape.circle,
          border: Border.all(color: Colors.black87,width: 5)
      ) ,
      margin: EdgeInsets.only(bottom: 10),
    );
  }
}

class Cabezera extends StatelessWidget{
  final double height;
  final String backgroundAssets;
  final String userAssets;
  final String userName;

  const Cabezera({Key key,this.height=200,@required this.backgroundAssets,@required this.userAssets,@required this.userName}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundAssets),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Usuario(assetsImage:userAssets,size: 100,),
          Text("@"+userName, style: TextStyle(color: Colors.white, fontSize:20),),
        ],
      ),
    );
  }
}

class Conexion extends StatelessWidget{
  final String tipo;
  final String cantidad;

  const Conexion({Key key,@required this.tipo,@required this.cantidad}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[Text(tipo),Text(cantidad)],);
  }
}

class Descripcion extends StatelessWidget {
  final String text;

  const Descripcion({Key key,@required this.text }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(text),
    );
  }
}
