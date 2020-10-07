import 'package:fittrack/common/general_widget.dart';
import 'package:fittrack/di/dependency_injection.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/data/data_model/rich_food_model.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/presentation/bloc/bloc.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/presentation/pages/rich_food_detail_screen.dart';
import 'package:fittrack/features/food_directory/presentation/pages/rich_food_directory/presentation/widget/rich_food_widget.dart';
import 'package:fittrack/ui_helper/colors.dart';
import 'package:fittrack/ui_helper/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RichFoodScreen extends StatelessWidget {
  List<RichFoodModel> list = [];
  String foodType;

  RichFoodScreen({this.foodType});

  Bloc bloc = getIt<RichFoodBloc>();

  @override
  Widget build(BuildContext context) {
    bloc.add(FetchRichFoodDataEvent(foodType: foodType));
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, state) {
        if (state is FetchRichFoodDataState) list = state.data;
      },
      child: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: theme,
                title: labels(text: carbsRichFood),
              ),
              body: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                  child: listItem(data: list[index]),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => RichFoodDetailScreen(data: list[index])),
                  ),
                ),
                separatorBuilder: (context, index) => listDivider(padding: 10),
                itemCount: list.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
