import 'package:bytebank/components/editor.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferencia'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo:'Número da Conta',
                dica: '0000'
            ),
            Editor(
                controlador :_controladorCampoValor,
                rotulo:'Valor',
                dica:'0.00',
                icone: Icons.monetization_on
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta =int.tryParse(_controladorCampoNumeroConta.text); // tryParse : para realizar conversão
    final double valor = double.tryParse(_controladorCampoValor.text);
    if(numeroConta !=null && valor !=null){
      final transferenciaCriada = Transferencia(valor,numeroConta);
      debugPrint('Criando transferencia');
      //debugPrint('$transferenciaCriada'); // debugPrint como boa prática para ver se está funcionando
      /* SnackBar que pode apresentar conteúdo em uma barra na parte inferior da tela
     Scaffold.of(context).showSnackBar(
       SnackBar(
         content: Text('$transferenciaCriada'),
       ),
     ); */
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}