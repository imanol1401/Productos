import 'package:myapp/src/models/productos_models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ProductosProvider{
  final String _url='https://flutter-productos-d730a-default-rtdb.firebaseio.com';
  
  Future<bool> crearProducto(ProductoModel producto) async{
    
    final url= '$_url/productos.json';
    
    final resp = await http.post( Uri.parse(url),
    body: jsonEncode(producto.toJson())
    );
    
    final decodeData = json.decode(resp.body); 
    
    print(decodeData);
    
    return true;
  }
}
