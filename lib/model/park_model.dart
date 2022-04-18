class ParkModel {
  late String sectorName;
  late int vacancy;

  ParkModel({
    required this.sectorName,
    required this.vacancy,
  });

  Map<String, dynamic> toMap() {
    return {
      'sectorName': sectorName,
      'vacancy': vacancy,
    };
  }

  @override
  String toString() {
    return 'ParkModel{sectorName: $sectorName, vacancy: $vacancy}';
  }
}
