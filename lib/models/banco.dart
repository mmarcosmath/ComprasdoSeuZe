import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quitandadoseuze/models/produto.dart';
import 'package:sqflite/sqflite.dart';

class Banco {
  static final _databaseName = "banco.db";
  static final _databaseVersion = 1;

  Banco._privateConstructor();
  static final Banco instance = Banco._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE produto(
          id INTEGER PRIMARY KEY,
          descricao TEXT NOT NULL,
          preco REAL NOT NULL,
          qtdKg REAL NOT NULL,
          total REAL NOT NULL
          )
          ''');
    // Map<String, dynamic> row = {
    //   'classificacao': '004',
    //   'nome': 'Ciência da Computação',
    // };
    // await db.insert('classificacao', row);
  }

  Future<int> insertProduto(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('produto', row);
  }

  Future<void> deleteTable() async {
    Database db = await instance.database;
    return await db.execute('''DELETE FROM produto''');
  }

  Future<void> deleteProd(String id) async {
    Database db = await instance.database;
    return await db.execute('''DELETE FROM produto WHERE id = $id''');
  }

  Future<List<Map<String, dynamic>>> listaProdutos() async {
    Database db = await instance.database;
    return await db.query('produto');
  }

  Future<Produto> getProduto(int id) async {
    Database db = await instance.database;
    var res = await db.rawQuery('SELECT FROM produto WHERE id = $id');
    return Produto.fromMap(res.first);
  }

  // Future<Livro> getLivro(int id) async {
  //   Database db = await instance.database;
  //   var res = await db.query('livro', where: 'idlivro = ?', whereArgs: [id]);
  //   return res.isNotEmpty ? Livro.fromJson(res.first) : null;
  // }

  // Future<List<Map<String, dynamic>>> getNaoLido() async {
  //   Database db = await instance.database;
  //   var res = await db.rawQuery(
  //       'SELECT exemplar.codigo,exemplar.nexemplar,classificacao.classificacao,livro.titulo FROM exemplar,classificacao,livro WHERE exemplar.lido = 0');
  //   return res;
  // }

  // Future<List<Map<String, dynamic>>> queryAllRowsClass() async {
  //   Database db = await instance.database;
  //   return await db.query('classificacao');
  // }

  Future<int> total() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM produto'));
  }

  // Future<int> naoLidos() async {
  //   Database db = await instance.database;
  //   return Sqflite.firstIntValue(
  //       await db.rawQuery('SELECT COUNT(*) FROM exemplar WHERE lido=0'));
  // }

  // void import(String dir) async {
  //   Database db = await instance.database;
  //   //await db.rawQuery('''.mode csv .import $dir exemplar''');
  //   // db.execute('''.mode csv exemplar .import $dir exemplar''');
  // }

  // Future<List> getall() async {
  //   Database db = await instance.database;
  //   var res = await db.query('exemplar');
  //   List<Exemplar> list =
  //       res.isNotEmpty ? res.map((c) => Exemplar.fromJson(c)).toList() : [];
  //   return list;
  // }

  Future<int> atualizaEdicao(Produto p) async {
    Database db = await instance.database;
    return await db.rawUpdate('''UPDATE produto SET 
          descricao = \'${p.descricao}\',
          preco = ${p.preco},
          qtdKg = ${p.qtdKg},
          total = ${p.total} WHERE id = ${p.id}''');
  }

  // Future<int> updateRestart() async {
  //   Database db = await instance.database;
  //   return await db.rawUpdate('''UPDATE exemplar SET lido=0''');
  // }

  void close() async {
    Database db = await instance.database;
    return await db.close();
  }

  // Future<int> update(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //   int id = row['codigo'];
  //   return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  // }

  // Future<int> delete(int id) async {
  //   Database db = await instance.database;
  //   return await db.delete('exemplar', where: 'codigo = ?', whereArgs: [id]);
  // }
}
