class SectorModel {
  String? nameSetor;
  int? vagas;

  SectorModel({required String nome, required int vagasSetor}) {
    nameSetor = nome;
    vagas = vagasSetor;
  }

  Map<String, dynamic> toMap() {
    return {
      'nomeSetor': nameSetor,
      'vagas': vagas,
    };
  }

  @override
  String toString() {
    return 'SectorModel{nomeSetor: $nameSetor, vagas: $vagas}';
  }
}
