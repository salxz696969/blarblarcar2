import 'package:blabla/data/ride_repository/ride_repository.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_view_model.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/ride_preference_content.dart';

class RidesSelectionScreen extends StatelessWidget {
  const RidesSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RidePreferenceState ridePreferenceState = context
        .watch<RidePreferenceState>();
    final RideRepository rideRepository = context.watch<RideRepository>();
    return ChangeNotifierProvider(
      create: (context) => RideSelectionViewModel(
        ridePreferenceState: ridePreferenceState,
        rideRepository: rideRepository,
      ),
      child: RidesSelectionContent(),
    );
  }
}
