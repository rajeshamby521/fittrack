import 'package:fittrack/common/appbar_widget.dart';
import 'package:fittrack/common/general/circular_progress_indicator.dart';
import 'package:fittrack/common/general_widget.dart';
import 'package:fittrack/di/dependency_injection.dart';
import 'package:fittrack/features/compare/data/dataModel/compare_model.dart';
import 'package:fittrack/features/compare/presentation/bloc/bloc.dart';
import 'package:fittrack/features/compare/presentation/widget/compare_widget.dart';
import 'package:fittrack/ui_helper/colors.dart';
import 'package:fittrack/ui_helper/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompareScreen extends StatefulWidget {
  Bloc bloc;

  CompareScreen({this.bloc});

  @override
  _CompareScreenState createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  final bloc = getIt<CompareBloc>();
  CompareDataModel list;
  bool isLoading = true;

  @override
  void initState() {
    bloc.add(GetCompareDataEvent(
      weight1: 10,
      weight2: 10,
      dateTime1: DateTime.now(),
      dateTime2: DateTime.now(),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, state) {
        if (state is GetCompareDataState) list = state.data;
      },
      child: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: appbar(bloc: widget.bloc, context: context, title: compare),
              floatingActionButton: extendedFloatingButton(
                context: context,
                bloc: bloc,
                icon: Icons.add,
                label: add,
                backgroundColor: theme,
                iconLabelColor: white,
                dialogContent: AddPhotoData(bloc: bloc),
              ),
              body: isLoading
                  ? circularProgressIndicator
                  : ListView.separated(
                      itemCount: list.compareList.length,
                      itemBuilder: (context, index) => listItem(
                        image1: list.compareList[index].image1,
                        image2: list.compareList[index].image2,
                        weight1: list.compareList[index].weight1,
                        weight2: list.compareList[index].weight2,
                        dateTime1: list.compareList[index].dateTime1,
                        dateTime2: list.compareList[index].dateTime2,
                      ),
                      separatorBuilder: (context, index) => listDivider(padding: 10),
                    ),
            ),
          );
        },
      ),
    );
  }
}
