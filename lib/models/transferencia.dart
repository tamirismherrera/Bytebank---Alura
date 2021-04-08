class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(
      this.valor,
      this.numeroConta,
  );

  @override
  String toString() { //Para verificar os valores da Transferencia
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}