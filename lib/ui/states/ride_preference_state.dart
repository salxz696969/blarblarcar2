import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePreferenceState extends ChangeNotifier {
  RidePreference? _ridePreference;

  RidePreference? get ridePreference => _ridePreference;

  void setRidePreference(RidePreference ridePreference) {
    if (_ridePreference == ridePreference) return;
    _ridePreference = ridePreference;
    notifyListeners();
  }

  void clearRidePreference() {
    if (_ridePreference == null) return;
    _ridePreference = null;
    notifyListeners();
  }

  void reverseLocation() {
    final pref = _ridePreference;
    if (pref == null) return;

    _ridePreference = RidePreference(
      departure: pref.arrival,
      departureDate: pref.departureDate,
      arrival: pref.departure,
      requestedSeats: pref.requestedSeats,
    );
    notifyListeners();
  }
}

