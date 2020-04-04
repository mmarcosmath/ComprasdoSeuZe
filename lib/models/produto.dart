class Produto {
  int id;
  String descricao;
  double preco;
  double qtdKg;
  double total;

  Produto({this.id, this.descricao, this.preco, this.qtdKg, this.total});

  Produto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricao = json['descricao'];
    preco = json['preco'];
    qtdKg = json['qtdKg'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['preco'] = this.preco;
    data['qtdKg'] = this.qtdKg;
    data['total'] = this.total;
    return data;
  }
}
