import 'package:cloud_firestore/cloud_firestore.dart';


class ApiService {
  ApiService();
  final db = FirebaseFirestore.instance;


  Future<List<Map<String, dynamic>>> getNegocios() async {
  final docRef = db.collection("negocios");
  final docs = await docRef.get();
  return docs.docs.map((doc) => doc.data()).toList();
}

Future<List<Map<String, dynamic>>> getDanios(String codAmbiente) async {
  final docRef = db.collection("articulosDaniados").where("articulosDaniados", isEqualTo: codAmbiente);
  final docs = await docRef.get();
  return docs.docs.map((doc) => doc.data()).toList();
}

  Future<List<Map<String, dynamic>>> getEncuestas(String negocio) async {
    final docRef = db.collection("encuestas");
    final docs = docRef.where('cod_negocio', isEqualTo: negocio).orderBy("fecha_encuesta");
    final result = await docs.get();
    if (result.docs.isNotEmpty){
      return result.docs.map((doc) => doc.data()).toList();
    } else {
      throw Exception('No existen encuestas para el negocio $negocio');
    }
    
}

Future<Map<String, dynamic>?> getEncuesta(String cod) async {
    DocumentSnapshot<Map<String, dynamic>> encuesta = await db.collection("encuestas").doc(cod).get();
    QuerySnapshot<Map<String, dynamic>> ambient = await db.collection('ambientes').where("cod_encuesta", isEqualTo: cod).get();
    QuerySnapshot<Map<String, dynamic>> work = await db.collection('trabajosRealizados').where("cod_encuesta", isEqualTo: cod).get();
    try {
      Map<String, dynamic> result = {
      'encuesta' : encuesta,
      'ambient' : ambient.docs,
      'work' : work.docs,
    };
      return result;
    } catch (e) {
      rethrow;
    }
  }

Future<Map<String, dynamic>> getProducto(String cod) async {
    final docRef = db.collection("articulos").doc(cod);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      return docSnapshot.data() as Map<String, dynamic>;
    } else {
      throw Exception('Producto no encontrado para el código $cod');
    }
  }

  Future<Map<String, dynamic>> getLote(String cod) async {
    final doc = await db.collection("lotes").where("num_lote", isEqualTo: cod).get();
    if (doc.docs.isNotEmpty) {
      return doc.docs.first.data();
    } else {
      throw Exception('Lote no encontrado para el código $cod');
    }
  }

  Future<void> newLote(String cod, String descripcion, String lote) async {
    final Map<String, dynamic> data = {
      "cod_lote" : cod,
      "descripcion" : descripcion,
      "num_lote" : lote,
    };

    try {
      await db.collection("lotes").doc(cod).set(data);
    } catch (e) {
      throw Exception('Error al crear el lote: $e');
    }
  }
Future<bool> loteExists(String cod) async {
    QuerySnapshot<Map<String, dynamic>> result = await db.collection('lotes').where("num_lote", isEqualTo: cod).get();
    if (result.size > 0) {
      return true;
    }
    else {
      return false;
    }

  }

Future<Map<String, dynamic>> getLotes() async {
    final docRef = db.collection("lotes").doc('lotes'); // Asumiendo que hay un documento con ID 'lotes'
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      return docSnapshot.data() as Map<String, dynamic>;
    } else {
      throw Exception('Lotes no encontrados');
    }
  }

  Future<bool> encuestaExists(String cod) async {
    DocumentSnapshot<Map<String, dynamic>> result = await db.collection('encuestas').doc(cod).get();
    if (result.exists) {
      return true;
    }
    else {
      return false;
    }

  }

Future<void> newEncuesta(String cod, String negocio, DateTime time, String estado, String correo) async {
    final Map<String, dynamic> data = {
      "cod_encuesta": cod,
      "cod_negocio": negocio,
      "fecha_encuesta": time,
      "fecha_inicial" : time,
      "estado": "Check-in",
      "correo_usuario": correo,
    };

    try {
      await db.collection("encuestas").doc(cod).set(data);
    } catch (e) {
      throw Exception('Error al crear la encuesta: $e');
    }
  }

  Future<void> newAmbient(String ambient, String cod, DateTime time, String estado, String encuesta) async {
    final Map<String, dynamic> data = {
      "ambiente": ambient,
      "cod_bodega_gondola": cod,
      "cod_encuesta" : encuesta,
      "estado_ambiente" : estado,
      "fecha_ambiente": time,
    };

    try {
      await db.collection("ambientes").doc(cod).set(data);
    } catch (e) {
      throw Exception('Error al crear la encuesta: $e');
    }
  }

  Future<void> regContaminacion(String cod, String encuesta, String estado, DateTime time) async {
    final Map<String, dynamic> data = {
      "cod_contaminacion": cod,
      "cod_encuesta": encuesta,
      "estado_contaminacion": estado,
      "fecha": "${time.day}/${time.month}/${time.year} ${time.hour}:${time.minute}:${time.second}",
    };

    try {
      await db.collection("contaminacion").doc(cod).set(data);
    } catch (e) {
      throw Exception('Error al registrar la contaminacion: $e');
    }
  }

   Future<void> regDamage({required int cantidad, required String cod, required String codDetalle, required String codBarras, required String codBodegaGondola, required String codLote, required String plaga, required String art, required DateTime time}) async {
    final Map<String, dynamic> data = {
      "cantidad_total" : cantidad,
      "codBarras" : codBarras,
      "cod_articulo_daniado": cod,
      "cod_ambientes": codBodegaGondola,
      "descripcion_art": art,
      "fecha_art_daniado": time,
    };

    final Map<String, dynamic> details = {
      "cantidad_paquete" : "$cantidad ",
      "cod_art_detalle" : codDetalle,
      "cod_articulo_daniado": cod,
      "cod_lote": codLote,
      "cod_plaga": art,
      "fecha_arti_daniado_det": time,
    };

    try {
      await db.collection("articulosDaniados").doc(cod).set(data);
      await db.collection("articulosDaniadosDetalles").doc(codDetalle).set(details);
    } catch (e) {
      throw Exception('Error al registrar el daño: $e');
    }
  }

  Future<void> regWork(String aspiracion, String limpieza, String revision, String retiro, String codEncuesta, String cod, DateTime time) async {
    final Map<String, dynamic> data = {
     "aspiracion" : aspiracion,
     "cod_encuesta" : codEncuesta,
     'cod_tipo_trabajo' : cod,
     "fecha_trabajo" : time,
     "limpieza" : limpieza,
     "retiro_product_contamin" : retiro,
     "revision_acomodo_product" : revision,
    };

    try {
      await db.collection("trabajosRealizados").doc(cod).set(data);
    } catch (e) {
      throw Exception('Error al registrar el ambiente: $e');
    }
  }

  Future<void> regDisplay(String cod, String encuesta, DateTime time, String isRotacion) async {

    final Map<String, dynamic> display = {
      "cod_display" : cod,
      "cod_encuesta" : encuesta,
      "estado_display" : isRotacion,
      "fecha_rotacion" : time,
    };


    try {
      await db.collection("displayVisita").doc(cod).set(display);
    } catch (e) {
      throw Exception('Error al registrar el ambiente: $e');
    }
  }

  Future<void> regRotacion(String cod, String codRotacion, String estado, DateTime time) async {

    final Map<String, dynamic> rotacion = {
      "cod_display" : cod,
      "cod_rotacion" : codRotacion,
      "rotacion" : estado,
      "fecha_rotacion" : time,
    };

    try {
      await db.collection("rotacion").doc(codRotacion).set(rotacion);
    } catch (e) {
      throw Exception('Error al registrar el ambiente: $e');
    }
  }

    Future<void> regOtros(String codPaquete, String codGorgojo, String encuesta, String huecos, DateTime time, String tipoGorgojo) async {

    final Map<String, dynamic> paquete = {
      "cod_encuesta" : encuesta,
      "cod_paquete" : codPaquete,
      "estado_paquete" : huecos,
      "fecha_paquete" : time,
    };

    final Map<String, dynamic> gorgojo = {
      "cod_encuesta" : encuesta,
      "cod_tipo_gorgojo" : codGorgojo,
      "fecha_gorgojo" : time,
      "tipo_gorgojo" : tipoGorgojo,
    };

    try {
      await db.collection("gorgojos").doc(codGorgojo).set(gorgojo);
      await db.collection("paquetes").doc(codPaquete).set(paquete);
    } catch (e) {
      throw Exception('Error al registrar el ambiente: $e');
    }
  }
}

ApiService api = ApiService();
