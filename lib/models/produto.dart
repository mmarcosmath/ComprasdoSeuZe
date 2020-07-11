import 'dart:convert';

class Produto {
  int id;
  String descricao;
  double preco;
  double qtdKg;
  double total;
  bool check;
  Produto({
    this.id,
    this.descricao,
    this.preco,
    this.qtdKg,
    this.total,
    this.check = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'preco': preco,
      'qtdKg': qtdKg,
      'total': total,
      'check': check,
    };
  }

  static Produto fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Produto(
      id: map['id'],
      descricao: map['descricao'],
      preco: map['preco'],
      qtdKg: map['qtdKg'],
      total: map['total'],
      check: map['check'],
    );
  }

  String toJson() => json.encode(toMap());

  static Produto fromJson(String source) => fromMap(json.decode(source));

  Produto copyWith({
    int id,
    String descricao,
    double preco,
    double qtdKg,
    double total,
    bool check,
  }) {
    return Produto(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
      preco: preco ?? this.preco,
      qtdKg: qtdKg ?? this.qtdKg,
      total: total ?? this.total,
      check: check ?? this.check,
    );
  }

  @override
  String toString() {
    return 'Produto(id: $id, descricao: $descricao, preco: $preco, qtdKg: $qtdKg, total: $total, check: $check)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Produto &&
        o.id == id &&
        o.descricao == descricao &&
        o.preco == preco &&
        o.qtdKg == qtdKg &&
        o.total == total &&
        o.check == check;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        descricao.hashCode ^
        preco.hashCode ^
        qtdKg.hashCode ^
        total.hashCode ^
        check.hashCode;
  }
}
