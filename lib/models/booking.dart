import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String id;
  final address_lat;
  final address_lng;
  final client_name;
  final service;
  final DateTime date;
  final cleaner_name;

  Booking({
    this.id = '',
    required this.address_lat,
    required this.address_lng,
    required this.client_name,
    required this.service,
    required this.date,
    required this.cleaner_name,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'address_lat': address_lat,
        'address_lng': address_lng,
        'client_name': client_name,
        'service': service,
        'date': date,
        'cleaner_name': cleaner_name,
      };

  // static Booking fromJson(Map<String, dynamic> Json) => Booking(
  //     id: json['id'],
  //     address_lat: json['address_lat']! as int,
  //     address_lng: json['address_lng']! as int,
  //     client_name: json['client_name'],
  //     service: json['service'],
  //     date: (json['date'] as Timestamp).toDate(),
  //     cleaner_name: json['cleaner_name']
  // );
}
