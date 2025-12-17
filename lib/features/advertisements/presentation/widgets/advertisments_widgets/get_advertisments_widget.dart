import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/get_ads/get_ads_cubit.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/advertisments_widgets/ad_widget.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/advertisments_widgets/get_ads_failure_widget.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/advertisments_widgets/get_ads_loading_widget.dart';

class GetAdvertismentsWidget extends StatelessWidget {
  const GetAdvertismentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAdsCubit, GetAdsState>(
      builder: (context, state) {
        if (state is GetAdsLoading) {
          return const SliverToBoxAdapter(child: GetAdsLoadingWidget());
        }

        if (state is GetAdsFailure) {
          return SliverToBoxAdapter(
            child: GetAdsFailureWidget(errorMessage: state.errorMessage),
          );
        }
        if (state is GetAdsLoaded) {
          final ads = state.ads;
          final hasMore = state.hasMore;

          return SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index < ads.length) {
                return AdWidget(advertisment: ads[index]);
              }
              if (hasMore && ads.length == index) {
                return const GetAdsLoadingWidget();
              }
              return SizedBox.shrink();
            }, childCount: hasMore ? ads.length + 1 : ads.length),
          );
        }
        if (state is GetAdsEmpty) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }

        if (state is GetAdsEndReached) {
          final ads = state.ads;
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => AdWidget(advertisment: ads[index]),
              childCount: ads.length,
            ),
          );
        }

        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
