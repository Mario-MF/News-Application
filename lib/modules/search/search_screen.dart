import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/shared/components/components.dart';
import 'package:newsapplication/shared/cubit/app_cubit.dart';
import 'package:newsapplication/shared/cubit/app_states.dart';
class SearchScreen extends  StatelessWidget {
  var searchCont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        var list=AppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body:  Scaffold(
            body:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  defaultForm(hintText: 'Search', icon: Icons.search,controller: searchCont,validator: (value){
                    if(value.isEmpty){
                      return 'Enter search';

                    }
                    return null;
                  },
                      txtType: TextInputType.text,onChanged: (value){
                    AppCubit.get(context).getSearch(value);

                      }),
                  Expanded(child: articleBuilder(list,context))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
