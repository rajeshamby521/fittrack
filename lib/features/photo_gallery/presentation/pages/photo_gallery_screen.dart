import 'package:fittrack/common/appbar_widget.dart';
import 'package:fittrack/common/general/circular_progress_indicator.dart';
import 'package:fittrack/common/general_widget.dart';
import 'package:fittrack/di/dependency_injection.dart';
import 'package:fittrack/features/photo_gallery/data/dataModel/photo_gallery_model.dart';
import 'package:fittrack/features/photo_gallery/presentation/bloc/bloc.dart';
import 'package:fittrack/features/photo_gallery/presentation/widget/photo_gallery_widget.dart';
import 'package:fittrack/ui_helper/colors.dart';
import 'package:fittrack/ui_helper/images.dart';
import 'package:fittrack/ui_helper/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoGalleryScreen extends StatefulWidget {
  Bloc bloc;

  PhotoGalleryScreen({this.bloc});

  @override
  _PhotoGalleryScreenState createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  final bloc = getIt<PhotoGalleryBloc>();
  PhotoGalleryDataModel list = PhotoGalleryDataModel();
  double weight;
  DateTime dateTime;
  bool isLoading = true;

  @override
  void initState() {
    bloc.add(GetPhotoGalleryDataEvent(weight: 10, dateTime: DateTime.now()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, state) {
        if (state is GetPhotoGalleryDataState) list = state.data;
        if (state is LoadingBeginHomeState) isLoading = true;
        if (state is LoadingEndHomeState) isLoading = false;
        if (state is GetPhotoGalleryWeightState) weight = state.weight;
        if (state is GetPhotoGalleryDateState) dateTime = state.dateTime;
      },
      child: BlocBuilder(
        bloc: bloc,
        builder: (BuildContext context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: appbar(bloc: widget.bloc, context: context, title: photoGallery),
              floatingActionButton: extendedFloatingButton(
                context: context,
                bloc: bloc,
                icon: Icons.add,
                label: add,
                backgroundColor: theme,
                iconLabelColor: white,
                dialogContent: AddPhotoData(bloc: bloc),
              ),
              body: Container(
                decoration: boxDecoration(
                  image: bg_home_screen,
                  colorFilter: ColorFilter.mode(black.withOpacity(0.8), BlendMode.dstATop),
                ),
                child: isLoading
                    ? circularProgressIndicator
                    : GridView.count(
                        crossAxisCount: 2,
                        children: List.generate(
                          list.photoGalleryList.length,
                          (index) => listItem(
                            date: list.photoGalleryList[index].dateTime,
                            weight: list.photoGalleryList[index].weight,
                            image: list.photoGalleryList[index].image,
                          ),
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
