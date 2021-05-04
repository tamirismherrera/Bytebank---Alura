import 'package:bytebank/models/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase()  async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute('CREATE TABLE contatos('
        'id INTEGER PRIMARY KEY, '
        'name TEXT, '
        'account_number INTEGER)');
    }, version: 1,
  //    onDowngrade: onDatabaseDowngradeDelete, //limpar os dados do banco
    );

  // return getDatabasesPath().then((dbPath) {
  //   final String path = join(dbPath, 'bytebank.db');
  //   return openDatabase(path, onCreate: (db, version) {
  //     db.execute('CREATE TABLE contatos('
  //         'id INTEGER PRIMARY KEY, '
  //         'name TEXT, '
  //         'account_number INTEGER)');
  //   }, version: 1,
  // //    onDowngrade: onDatabaseDowngradeDelete, //limpar os dados do banco
  //   );
  // });
}

Future<int> save(Contato contato) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contatoMap = Map();
  contatoMap['name'] = contato.nome;
  contatoMap['account_number'] = contato.numeroConta;
  return db.insert('contatos', contatoMap);

  // return getDatabase().then((db) {
  //   final Map<String, dynamic> contatoMap = Map();
  //   contatoMap['name'] = contato.nome;
  //   contatoMap['account_number'] = contato.numeroConta;
  //   return db.insert('contatos', contatoMap);
  // });
}

Future <List<Contato>>findAll() async {

  final Database db = await getDatabase();
  final List<Map<String,dynamic>> result = await db.query('contatos');
  // ignore: deprecated_member_use
  final List<Contato> contatos = List();
  for (Map<String, dynamic> row in result) {
      final Contato contato = Contato(
        row['id'],
        row['name'],
        row['account_number'],
      );
      contatos.add(contato);
    }
  return contatos;

  // return getDatabase().then((db) {
  //   return db.query('contatos').then((maps) {
  //     final List<Contato> contatos = List();
  //     for (Map<String, dynamic> row in maps) {
  //       final Contato contato = Contato(
  //         row['id'],
  //         row['name'],
  //         row['account_number'],
  //       );
  //       contatos.add(contato);
  //     }
  //     return contatos;
  //   });
  // });
}
