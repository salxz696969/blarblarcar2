import 'package:blabla/data/location_repository/location_repository.dart';
import 'package:blabla/data/location_repository/location_repository_mock.dart';
import 'package:blabla/data/ride_pref_repository/ride_pref_repository.dart';
import 'package:blabla/data/ride_pref_repository/ride_pref_repository_mock.dart';
import 'package:blabla/data/ride_repository/ride_repository.dart';
import 'package:blabla/data/ride_repository/ride_repository_mock.dart';
import 'package:blabla/data/user_repository/user_repository_mock.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:provider/provider.dart';

import 'main_common.dart';

List<InheritedProvider> get devProviders {
  final locationRepository = LocationRepositoryMock();
  final userRepository = UserRepositoryMock();
  final ridePrefRepository = RidePrefRepositoryMock(
    locationRepository: locationRepository,
  );
  
  return [
    Provider<LocationRepository>(create: (context) => locationRepository),
    Provider<RidePrefRepository>(
      create: (context) => ridePrefRepository,
    ),
    Provider<RideRepository>(
      create: (context) => RideRepositoryMock(
        locationRepository: locationRepository,
        userRepository: userRepository,
      ),
    ),
    ChangeNotifierProvider<RidePreferenceState>(
      create: (context) => RidePreferenceState(ridePrefRepository: ridePrefRepository ),
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
