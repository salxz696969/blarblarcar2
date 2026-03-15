import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';
import 'package:blabla/ui/screens/rides_selection/view_model/ride_selection_view_model.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/ride_preference_modal.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_header.dart';
import 'package:blabla/ui/screens/rides_selection/widgets/rides_selection_tile.dart';
import 'package:blabla/utils/animations_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme.dart';

///
///  The Ride Selection screen allows user to select a ride, once ride preferences have been defined.
///  The screen also allow user to:
///   -  re-define the ride preferences
///   -  activate some filters.
///
class RidesSelectionContent extends StatelessWidget {
  const RidesSelectionContent({super.key});

  void onBackTap(BuildContext context) {
    Navigator.pop(context);
  }

  void onFilterPressed() {
    // TODO
  }

  void onRideSelected(RideSelectionViewModel viewModel, Ride ride) {}

  void onPreferencePressed(
    BuildContext context,
    RideSelectionViewModel viewModel,
  ) async {
    final RidePreference? newPreference = await Navigator.of(context)
        .push<RidePreference>(
          AnimationUtils.createRightToLeftRoute(
            RidePreferenceModal(
              initialPreference: viewModel.selectedRidePreference,
            ),
          ),
        );

    if (newPreference != null) {
      viewModel.updateRidePreference(newPreference);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RideSelectionViewModel>();
    final matchingRides = viewModel.matchingRides(
      viewModel.selectedRidePreference,
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: BlaSpacings.m,
          right: BlaSpacings.m,
          top: BlaSpacings.s,
        ),
        child: Column(
          children: [
            RideSelectionHeader(
              ridePreference: viewModel.selectedRidePreference,
              onBackPressed: () => onBackTap(context),
              onFilterPressed: onFilterPressed,
              onPreferencePressed: () =>
                  onPreferencePressed(context, viewModel),
            ),
            SizedBox(height: 100),
            Expanded(
              child: ListView.builder(
                itemCount: matchingRides.length,
                itemBuilder: (ctx, index) => RideSelectionTile(
                  ride: matchingRides[index],
                  onPressed: () =>
                      onRideSelected(viewModel, matchingRides[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
