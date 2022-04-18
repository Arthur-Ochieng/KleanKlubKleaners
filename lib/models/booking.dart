import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String id;
  final address_lat;
  final address_lng;
  //final client_name;
  final service;
  final DateTime date;
  final time;
  // final cleaner_name;

  Booking({
    this.id = '',
    required this.time,
    required this.address_lat,
    required this.address_lng,
    //required this.client_name,
    required this.service,
    required this.date,
    // required this.cleaner_name,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'address_lat': address_lat,
        'address_lng': address_lng,
        //'client_name': client_name,
        'service': service,
        'date': date,
        //'cleaner_name': cleaner_name,
        'time': time,
      };

  factory Booking.fromFirebaseMap(Map<String, Object?> data) {
    return Booking(
      id: data['id'] as String,
      address_lat: data['address_lat'],
      address_lng: data['address_lng'],
      // client_name: data['client_name'],
      service: data['service'],
      date: (data['date'] as Timestamp).toDate(),
      //cleaner_name: data['cleaner_name'],
      time: data['time'],
    );
  }

  static Booking fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        address_lat: json["address_lat"],
        address_lng: json["address_lng"],
        // client_name: client_name,
        service: json["service"],
        date: json["date"],
        time: json["time"],
        // cleaner_name: cleaner_name)
      );
}
