import 'package:animated_widgets/widgets/scale_animated.dart';
import 'package:fittrack/di/dependency_injection.dart';
import 'package:fittrack/features/dashboard/presentation/bloc/bloc.dart';
import 'package:fittrack/features/dashboard/presentation/widget/dashboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardScreen extends StatefulWidget {
  static bool animate = false;
  int pageNo;

  DashBoardScreen({this.pageNo});

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final bloc = getIt<DashboardBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, state) {
        if (state is AnimatePageState) DashBoardScreen.animate = state.animate;
        print(DashBoardScreen.animate);
      },
      child: BlocBuilder<DashboardBloc, DashboardState>(
        bloc: bloc,
        builder: (BuildContext context, state) {
          return ScaleAnimatedWidget(
            enabled: DashBoardScreen.animate,
            // enabled: true,
            duration: Duration(milliseconds: 300),
            values: [0.7, 1],
            child: DashBoardPage(pageNo: widget.pageNo, bloc: bloc),
          );
        },
      ),
    );
  }
}
