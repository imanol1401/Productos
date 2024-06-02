import 'package:myapp/src/models/productos_models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class ProductosProvider{
  final String _url='https://flutter-productos-d730a.firebaseio.com';
  
  Future<bool> crearProducto(ProductoModel producto) async{
    
    final url= '$_url/productos.json';
    
    final resp = await http.post(url as Uri, body: productoModelToJson(producto));
    
    final decodeData = json.decode(resp.body);
    
    print(decodeData);
    
    return true;
  }
}
