import 'package:parking_flutter_raro/model/park_model.dart';

class CarModel {
  late DateTime entryDate;
  DateTime? departureDate;
  String? plate;
  String? ownerName;
  String? phoneNumber;
  late ParkModel park;

  CarModel({
    required this.entryDate,
    this.departureDate,
    this.plate,
    this.ownerName,
    this.phoneNumber,
    required this.park,
  });

  Map<String, dynamic> toMap() {
    return {
      'entryDate': entryDate.toIso8601String(),
      'departureDate': departureDate?.toIso8601String(),
      'plate': plate,
      'ownerName': ownerName,
      'phoneNumber': phoneNumber,
      'sectorName': park.sectorName,
      'vacancy': park.vacancy,
    };
  }

  @override
  String toString() {
    return 'CarModel{entryDate: $entryDate, departureDate: $departureDate, plate: $plate, ownerName: $ownerName, phoneNumber: $phoneNumber}';
  }
}
