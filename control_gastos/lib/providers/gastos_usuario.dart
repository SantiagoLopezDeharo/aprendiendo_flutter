import 'package:control_gastos/modelos/gasto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

final categoriaArray = [Categoria.comida, Categoria.viaje, Categoria.placer, Categoria.trabajo];

class GastosUsuarioNotifier extends StateNotifier<List<Gasto>> {
  GastosUsuarioNotifier() : super(const []);

  Future<sql.Database> _getDatabase() async {
    final dbpath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbpath, "gastos.db"),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE gastos(id TEXT PRIMARY KEY, title TEXT, amount REAL, date TEXT, categoria INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<void> loadData() async {
    final db = await _getDatabase();
    final data = await db.rawQuery("SELECT * FROM gastos");
    final gastos = data.map((row) => Gasto(
          id: row["id"] as String,
          title: row["title"] as String,
          amount: row["amount"] as double,
          date: DateTime.parse(row["date"] as String),
          categoria: categoriaArray[row["categoria"] as int],
        )).toList();
    state = gastos;
    await db.close();
  }

  Future<void> agregarGasto(String id, String title, double amount, DateTime date, Categoria categoria) async {
    final db = await _getDatabase();
    final nuevo = Gasto(id: id, title: title, amount: amount, date: date, categoria: categoria);

    await db.insert(
      "gastos",
      {
        "id": nuevo.id,
        "title": nuevo.title,
        "amount": nuevo.amount,
        "date": date.toIso8601String(),
        "categoria": categoriaArray.indexOf(categoria),
      },
    );

    state = [...state, nuevo];
    await db.close();
  }

  Future<void> removerGasto(Gasto gasto) async {
    final db = await _getDatabase();

    final rowsAffected = await db.delete(
      "gastos",
      where: "title = ? and amount = ?",
      whereArgs: [gasto.title, gasto.amount],
    );
    print("aaaaaaaaaaaaaaaaaaaaaa  $rowsAffected");

    state = state.where((item) => item.id != gasto.id).toList();
    await db.close();
  }
}

final GastosUsuarioProvider =
    StateNotifierProvider<GastosUsuarioNotifier, List<Gasto>>(
  (ref) => GastosUsuarioNotifier(),
);
