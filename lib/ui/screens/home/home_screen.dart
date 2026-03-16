import 'package:blabla/ui/screens/home/view_model/home_view_model.dart';
import 'package:blabla/ui/states/ride_preference_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RidePreferenceState ridePreferenceState = context
        .watch<RidePreferenceState>();
    final HomeViewModel viewModel = HomeViewModel(
      ridePreferenceState: ridePreferenceState,
    );
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: HomeContent(viewModel: viewModel),
    );
  }
}
