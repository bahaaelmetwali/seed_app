import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seed_app/constants/assets.dart';
import 'package:seed_app/core/utils/styles.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/get_ads/get_ads_cubit.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/ad_widget.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/categories_section.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/get_ads_loading_widget.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/home_app_bar.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/show_all_details_section.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        context.read<GetAdsCubit>().fetchMoreAds();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(child: HomeAppBar()),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(top: 16.r, left: 24.r, right: 24.r),
            child: SvgPicture.asset(
              Assets.logosHomeBackground,
              height: 180.h,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverToBoxAdapter(child: CategoriesSection()),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 8.r),
            child: ShowAllDetails(details: 'المشاريع', onTap: () {}),
          ),
        ),
        BlocBuilder<GetAdsCubit, GetAdsState>(
          builder: (context, state) {
            if (state is GetAdsLoading) {
              return const SliverToBoxAdapter(child: GetAdsLoadingWidget());
            }

            if (state is GetAdsFailure) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Text(
                    state.errorMessage,
                    style: TextStyles.textStyle20,
                  ),
                ),
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
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: GetAdsLoadingWidget(),
                  );
                }, childCount: hasMore ? ads.length + 1 : ads.length),
              );
            }

            return const SliverToBoxAdapter(child: SizedBox.shrink());
          },
        ),
      ],
    );
  }
}
