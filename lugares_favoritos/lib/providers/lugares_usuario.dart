import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lugares_favoritos/modelos/lugar.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class LugaresUsuarioNotifier extends StateNotifier<List<Lugar>> {
  LugaresUsuarioNotifier() : super(const []);

  Future<void> loadData() async {
    final dbpath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbpath, "lugares.db"),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE lugares(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL)");
      },
      version: 1,
    );
    final data = await db.query("lugares");
    final lugares = data.map(
      (row) =>
          Lugar(
            id: row["id"] as String,
            title: row["title"] as String, 
            imagen: File(row["image"] as String), 
            ubicacion: LugarUbicacion(latitude: row["lat"] as double, longitude: row["lng"] as double))
      ).toList();
    state = lugares;
  }

  void agregarLugar(String title, File imagen, LugarUbicacion ubi) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final filename =imagen.path.split('/').last;

    final copia = await imagen.copy("${appDir.path}/$filename");
    final nuevo = Lugar(title: title, imagen: copia, ubicacion: ubi);

    final dbpath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbpath, "lugares.db"),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE lugares(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL)");
      },
      version: 1,
    );

    db.insert(
      "lugares",
      {
        "id": nuevo.id,
        "title": nuevo.title,
        "image": nuevo.imagen.path,
        "lat": nuevo.ubicacion.latitude,
        "lng": nuevo.ubicacion.longitude,
      },
    );

    state = [nuevo, ...state];
  }
}

final LugaresUsuarioProvider =
    StateNotifierProvider<LugaresUsuarioNotifier, List<Lugar>>(
  (ref) => LugaresUsuarioNotifier(),
);
