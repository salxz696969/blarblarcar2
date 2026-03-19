import 'package:blabla/data/ride_repository/ride_repository.dart';
import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';

class RideSelectionViewModel extends ChangeNotifier {
  final RidePreferenceState ridePreferenceState;
  final RideRepository rideRepository;

  RideSelectionViewModel({
    required this.ridePreferenceState,
    required this.rideRepository,
  }) {
    ridePreferenceState.addListener(notifyListeners);
  }

  RidePreference selectedRidePreference() {
    return ridePreferenceState.ridePreference ??
        (ridePreferenceState.history.isNotEmpty
            ? ridePreferenceState.history.last
            : throw StateError('No ride preference available'));
  }

  List<Ride> matchingRides(RidePreference preferences) {
    return rideRepository
        .getRides()
        .where(
          (ride) =>
              ride.departureLocation == preferences.departure &&
              ride.arrivalLocation == preferences.arrival &&
              ride.availableSeats >= preferences.requestedSeats,
        )
        .toList();
  }

  void updateRidePreference(RidePreference newPreference) {
    ridePreferenceState.setRidePreference(newPreference);
  }

  void onRideSelected(Ride ride) {
    // Later
  }

  @override
  void dispose() {
    ridePreferenceState.removeListener(notifyListeners);
    super.dispose();
  }
}
