import 'package:blabla/data/ride_pref_repository/ride_pref_repository.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:flutter/material.dart';

class RidePreferenceState extends ChangeNotifier {
  RidePrefRepository ridePrefRepository;

  RidePreferenceState({required this.ridePrefRepository}) {
    initHistory();
  }

  RidePreference? _currentRidePreference;
  List<RidePreference> _history = [];

  RidePreference? get ridePreference => _currentRidePreference;
  int get maxAllowedSeats => 8;

  void initHistory() {
    _history = ridePrefRepository.ridePreferences;
    notifyListeners();
  }

  void setRidePreference(RidePreference ridePreference) {
    if (_currentRidePreference == ridePreference) return;
    _currentRidePreference = ridePreference;
    _history.add(ridePreference);
    notifyListeners();
  }

  List<RidePreference> get history => _history;
}
