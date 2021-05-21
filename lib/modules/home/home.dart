import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/shared/components/components.dart';
import 'package:newsapplication/shared/cubit/app_cubit.dart';
import 'package:newsapplication/shared/cubit/app_states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return ConditionalBuilder(
          condition: state is! AppGetBusinessLoadingStates,
          builder: (BuildContext context) {
            return ListView.separated(
                itemBuilder: (context, index) => defaultListItem(
                    AppCubit.get(context).business[index], context),
                separatorBuilder: (context, index) => Container(),
                itemCount: AppCubit.get(context).business.length);
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

}
