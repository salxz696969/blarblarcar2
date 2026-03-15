import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePreferenceState extends ChangeNotifier {
  RidePreference? _currentRidePreference;
  List<RidePreference> _history = [];

  RidePreference? get ridePreference => _currentRidePreference;

  void setRidePreference(RidePreference ridePreference) {
    if (_currentRidePreference == ridePreference) return;
    _currentRidePreference = ridePreference;
    _history.add(ridePreference);
    notifyListeners();
  }

  void clearRidePreference() {
    if (_currentRidePreference == null) return;
    _currentRidePreference = null;
    notifyListeners();
  }

  void reverseLocation() {
    final pref = _currentRidePreference;
    if (pref == null) return;

    _currentRidePreference = RidePreference(
      departure: pref.arrival,
      departureDate: pref.departureDate,
      arrival: pref.departure,
      requestedSeats: pref.requestedSeats,
    );
    notifyListeners();
  }

  List<RidePreference> get history => _history;
}