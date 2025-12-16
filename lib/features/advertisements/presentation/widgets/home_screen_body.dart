import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seed_app/features/advertisements/presentation/cubits/get_ads/get_ads_cubit.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/categories_section_widgets/categories_section.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/advertisments_widgets/get_advertisments_widget.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/home_app_bar.dart';
import 'package:seed_app/features/advertisements/presentation/widgets/home_back_ground.dart';
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
          child: HomeBackGround(),
        ),
        SliverToBoxAdapter(child: CategoriesSection()),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 8.r),
            child: ShowAllDetails(details: 'المشاريع', onTap: () {}),
          ),
        ),
        GetAdvertismentsWidget(),
      ],
    );
  }
}


