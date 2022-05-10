import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String id;
  final address_lat;
  final address_lng;
  final service;
  final DateTime date;
  final time;

  Booking({
    this.id = '',
    required this.time,
    required this.address_lat,
    required this.address_lng,
    required this.service,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'address_lat': address_lat,
        'address_lng': address_lng,
        'service': service,
        'date': date,
        'time': time,
      };

  factory Booking.fromFirebaseMap(Map<String, Object?> data) {
    return Booking(
      id: data['id'] as String,
      address_lat: data['address_lat'],
      address_lng: data['address_lng'],
      service: data['service'],
      date: (data['date'] as Timestamp).toDate(),
      time: data['time'],
    );
  }

  static Booking fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        address_lat: json["address_lat"],
        address_lng: json["address_lng"],
        service: json["service"],
        date: json["date"],
        time: json["time"],
      );
}
