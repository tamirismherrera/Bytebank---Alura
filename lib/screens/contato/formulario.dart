import 'package:bytebank/database/dao/contato_dao.dart';
import 'package:bytebank/models/contato.dart';
import 'package:flutter/material.dart';

class FormularioContatos extends StatefulWidget {

  @override
  _FormularioContatosState createState() => _FormularioContatosState();
}

class _FormularioContatosState extends State<FormularioContatos> {
  final TextEditingController _controladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controladorCampoNome,
              decoration: InputDecoration(
                labelText: 'Nome Completo',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _controladorCampoNumeroConta,
                decoration: InputDecoration(
                  labelText: 'Número da Conta',
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                // ignore: deprecated_member_use
                child: RaisedButton(
                    child: Text('Adicionar'),
                    onPressed: () {
                      final String nome = _controladorCampoNome.text;
                      final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
                      final Contato novoContato = Contato(0,nome, numeroConta);
                      _dao.save(novoContato).then((id)=>Navigator.pop(context));
                    }
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
