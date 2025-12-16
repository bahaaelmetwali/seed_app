import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/features/advertisements/domain/entities/advertisment.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/get_ads/get_ads_cubit.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/ad_widget.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/get_ads_failure_widget.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/get_ads_loading_widget.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/show_all_details_section.dart';

class AdsListWidget extends StatelessWidget {
  const AdsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAdsCubit, GetAdsState>(
      builder: (context, state) {
        if (state is GetAdsLoaded) {
          final List<Advertisment> ads = state.ads;
          return NotificationListener<ScrollNotification>(
            onNotification: (notifcation) {
              if (notifcation.metrics.pixels ==
                  notifcation.metrics.maxScrollExtent) {
                if (state.hasMore == true) {
                  context.read<GetAdsCubit>().fetchMoreAds();
                }
              }
              return true;
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              
                ads.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.hasMore ? ads.length + 1 : ads.length,
                        itemBuilder: (context, index) {
                          if (index == ads.length) {
                            return GetAdsLoadingWidget();
                          } else {
                            return AdWidget(advertisment: ads[index]);
                          }
                        },
                      )
                    : Padding(
                        padding: EdgeInsets.all(64.r),
                        child: Center(
                          child: Text(
                            'لا يوجد اعلانات',
                            style: TextStyles.textStyle14,
                          ),
                        ),
                      ),
              ],
            ),
          );
        } else if (state is GetAdsLoading) {
          return GetAdsLoadingWidget();
        } else if (state is GetAdsFailure) {
          final String errorMessage = state.errorMessage;
          return GetAdsFailureWidget(errorMessage: errorMessage);
        } else {
          return Text('');
        }
      },
    );
  }
}
