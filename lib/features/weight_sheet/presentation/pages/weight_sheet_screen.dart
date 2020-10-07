import 'package:fittrack/common/appbar_widget.dart';
import 'package:fittrack/common/general/circular_progress_indicator.dart';
import 'package:fittrack/common/general_widget.dart';
import 'package:fittrack/di/dependency_injection.dart';
import 'package:fittrack/features/weight_sheet/data/datamodel/weight_sheet_model.dart';
import 'package:fittrack/features/weight_sheet/presentation/bloc/bloc.dart';
import 'package:fittrack/features/weight_sheet/presentation/widget/weight_sheet_widget.dart';
import 'package:fittrack/ui_helper/colors.dart';
import 'package:fittrack/ui_helper/images.dart';
import 'package:fittrack/ui_helper/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeightSheetScreen extends StatefulWidget {
  Bloc bloc;

  WeightSheetScreen({this.bloc});

  @override
  _WeightSheetScreenState createState() => _WeightSheetScreenState();
}

class _WeightSheetScreenState extends State<WeightSheetScreen> {
  final bloc = getIt<WeightSheetBloc>();
  WeightSheetModel weightSheetDataList;
  bool isLoading = true;
  bool isPageLoading = false;
  int offSet = 0;
  List<Datum> weightList = List<Datum>();

  @override
  void initState() {
    bloc.add(GetWeightSheetEvent(offSet: offSet));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, state) {
        if (state is LoadingBeginHomeState)
          isLoading = true;
        else if (state is LoadingEndHomeState)
          isLoading = false;
        else if (state is GetWeightSheetState) {
          weightSheetDataList = state.data;
          weightList.addAll(weightSheetDataList.data);
        }
      },
      child: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: appbar(bloc: widget.bloc, title: weightSheet, context: context),
              body: Container(
                  decoration: boxDecoration(
                      image: bg_bmi_screen,
                      color: veryLightTheme,
                      colorFilter: ColorFilter.mode(black.withOpacity(1), BlendMode.dstATop)),
                  child: isLoading ? circularProgressIndicator : _createListView()
                  // : ListView.builder(
                  //     controller: _scrollController,
                  //     itemCount: weightSheetDataList.data.length,
                  //     itemBuilder: (BuildContext context, int index) => weightSheetListItem(
                  //       dateTime: weightSheetDataList.data[index].createDate,
                  //       weightList: weightSheetDataList.data[index].weightData,
                  //     ),
                  //   ),
                  ),
              floatingActionButton: extendedFloatingButton(
                context: context,
                bloc: bloc,
                icon: Icons.add,
                label: add,
                iconLabelColor: white,
                backgroundColor: theme,
                dialogContent: AddWeightData(bloc: bloc),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _createListView() {
    ScrollController _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
        if (!isPageLoading) {
          isPageLoading = !isPageLoading;
          // Perform event when user reach at the end of list (e.g. do Api call)
        }
        print("***--- $isPageLoading");
        offSet = weightSheetDataList.nextOffset;
        if (offSet != -1) {
          bloc.add(GetWeightSheetEvent(offSet: offSet));
        }
      }
    });
    return ListView.builder(
      controller: _scrollController,
      itemCount: weightList.length,
      itemBuilder: (BuildContext context, int index) {
        print("Date... ${weightList[index].createDate}");
        return weightSheetListItem(
          dateTime: weightList[index].createDate,
          weightList: weightList[index].weightData,
        );
      },
    );
  }
}
