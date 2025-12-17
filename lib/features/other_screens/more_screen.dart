import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seed_app/core/service_locator.dart';
import 'package:seed_app/core/utils/constants.dart';
import 'package:seed_app/core/widgets/show_custom_snack_bar.dart';
import 'package:seed_app/features/auth/domain/use_cases/get_profile_use_case.dart';
import 'package:seed_app/features/auth/presentation/cubits/cubit/get_profile_cubit.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProfileCubit(getIt<GetProfileUseCase>()),
      child: Scaffold(
        backgroundColor: Constants.kscaffoldColor,
        body: MoreBody(),
      ),
    );
  }
}

class MoreBody extends StatefulWidget {
  const MoreBody({super.key});

  @override
  State<MoreBody> createState() => _MoreBodyState();
}

class _MoreBodyState extends State<MoreBody> {
  @override
  void initState() {
    context.read<GetProfileCubit>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProfileCubit, GetProfileState>(
      listener: (context, state) {
        if (state is GetProfileFailure) {
          showCustomSnackBar(context, message: state.message);
        }
      },
      builder: (context, state) {
        if (state is GetProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetProfileFailure) {
          return Center(
            child: Text(
              "حدث خطأ: ${state.message}",
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (state is GetProfileSuccess) {
          final user = state.user;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (user.image != null)
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.image!),
                  ),
                const SizedBox(height: 16),
                Text("Name: ${user.name ?? '-'}"),
                Text("Email: ${user.email ?? '-'}"),
                Text("Mobile: ${user.mobile}"),
              ],
            ),
          );
        } else {
          return const Text('hello');
        }
      },
    );
  }
}
