import 'package:devflow/core/extension/app_extensions.dart';
import 'package:devflow/core/widgets/app_text_widget.dart';
import 'package:devflow/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:devflow/features/home/presentation/widgets/home_card_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeInfo extends StatelessWidget {
  const HomeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthBloc>().state.user;

    return HomeCardTile(
      color: context.colors.outline,
      child: Column(
        children: [
          AppText('Good Morning, ${user?.fullName}'),

          context.spacing.vMd,

          AppText('Lets make today productive'),
        ],
      ),
    );
  }
}
