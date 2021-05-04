import 'package:bytebank/models/contato.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bytebank/database/app_database.dart';

class ContatoDao{

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  static const String _tableName = 'contatos';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contato contato) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contatoMap = _toMap(contato);
    return db.insert(_tableName, contatoMap);
  }

  Map<String, dynamic> _toMap(Contato contato) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap[_name] = contato.nome;
    contatoMap[_accountNumber] = contato.numeroConta;
    return contatoMap;
  }

  Future <List<Contato>>findAll() async {
    final Database db = await getDatabase();
    final List<Map<String,dynamic>> result = await db.query(_tableName);
    // ignore: deprecated_member_use
    List<Contato> contatos = _toList(result);
    return contatos;
  }

  List<Contato> _toList(List<Map<String, dynamic>> result) {
       // ignore: deprecated_member_use
       final List<Contato> contatos = List();
    for (Map<String, dynamic> row in result) {
      final Contato contato = Contato(
        row[_id],
        row[_name],
        row[_accountNumber],
      );
      contatos.add(contato);
    }
    return contatos;
  }
}