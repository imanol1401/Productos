import 'package:flutter/material.dart';
import 'package:myapp/src/providers/productos_provider.dart';
import 'package:myapp/src/utils/utils.dart' as utils;
import 'package:myapp/src/models/productos_models.dart';

class ProductoPage extends StatefulWidget{

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formkey=GlobalKey<FormState>();

  final productoProvider = new ProductosProvider();

  ProductoModel producto = ProductoModel(id: '', titulo: '', valor:0.00, disponible: true, fotoUrl: '');
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text('Producto'),

        actions: <Widget>[

          IconButton(
            icon: const Icon(Icons.photo_size_select_actual),
            onPressed: (){}
          ),

          IconButton(
            icon:const Icon(Icons.camera_alt),
            onPressed: () {},
          ), 

          

        ],
      ),

      body:  SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child:  Form(
            key: formkey,
            child: Column(
              children: <Widget>[

                _crearNombre(),
                _crearPrecio(),
                _creBoton(),
                _crearDisponible(),
                


              ],
            ),
          ),
        ),
      ),
    );
  }

_crearPrecio(){
    return TextFormField(

      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Precio'
      ),

      onSaved: (newValue) => producto.valor = double.parse(newValue!),

      validator: (value){
        if(utils.isNumeric(value!)){
          return null;
        }else{
          return 'Solo Numeros' ;
        }
      }
      
    );
  }



  _crearNombre() {
    return TextFormField(

      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Nombre'
      ),

      onSaved: (newValue) => producto.titulo = newValue!,

  validator: (value){
    if(value!.length <3){
      return 'Ingrese el nombre del producto';
    }else{
      return null;
    }


  }
    );
  }



_submit() {
  if(!formkey.currentState!.validate()){
    return;

  }
  formkey.currentState!.save();

    print('Producto Guardado:');
    print('Título: ${producto.titulo}');
    print('Valor: ${producto.valor}');
    print('Disponible: ${producto.disponible}');

    productoProvider.crearProducto(producto);

    final snackBar = SnackBar(
      content: Text('Producto Guardado: ${producto.titulo} - Precio: ${producto.valor} - Disponible: ${producto.disponible}'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

}



_creBoton() {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2039069758.
  return ElevatedButton.icon(
    onPressed: _submit,
    icon: const Icon(Icons.save),
    label: const Text('Guardar')
    );

  }


_crearDisponible(){

  return SwitchListTile(
    value: producto.disponible,
    title: const Text('Disponible'),
    activeColor: Colors.indigo,
    onChanged: (value){
      setState(() {
        producto.disponible = value;
      });
    }
  );

}
}
