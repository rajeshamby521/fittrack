import 'package:fittrack/common/appbar_widget.dart';
import 'package:fittrack/di/dependency_injection.dart';
import 'package:fittrack/features/chart/data/dataModel/chart_model.dart';
import 'package:fittrack/features/chart/presentation/bloc/bloc.dart';
import 'package:fittrack/ui_helper/strings.dart';
import 'package:fittrack/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartScreen extends StatefulWidget {
  final Bloc bloc;

  ChartScreen({Key key, this.bloc});

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final bloc = getIt<ChartBloc>();
  ChartModel chartData;

  @override
  void initState() {
    bloc.add(GetChartDataEvent(month: "", dateType: "1"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, state) {
        if (state is GetChartDataState) chartData = state.data;
      },
      child: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: appbar(bloc: widget.bloc, context: context, title: chart),
            body: SafeArea(
              child: Container(
                height: height * 0.5,
                child: null,
              ),
            ),
          );
        },
      ),
    );
  }
}
