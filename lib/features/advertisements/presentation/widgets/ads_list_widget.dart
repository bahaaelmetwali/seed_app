import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/features/advertisements/domain/entities/advertisment.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/get_ads/get_ads_cubit.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/get_ads_failure_widget.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/get_ads_loaded_widget.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/get_ads_loading_widget.dart';

class AdsListWidget extends StatelessWidget {
  const AdsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAdsCubit, GetAdsState>(
      builder: (context, state) {
        if (state is GetAdsLoaded) {
          final List<Advertisment?> ads = state.ads;
          return GetAdsLoadedWidget(ads: ads);
        } else if (state is GetAdsLoading) {
          return GetAdsLoadingWidget();
        } else if (state is GetAdsFailure) {
          final String errorMessage = state.errorMessage;
          return GetAdsFailureWidget(errorMessage: errorMessage);
        } else {
          return Text('There was an Error', style: TextStyles.textStyle20);
        }
      },
    );
  }
}
