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
  PhotoGalleryModel list = PhotoGalleryModel();
  double weight;
  DateTime dateTime;
  bool isLoading = true;
  int offSet = 0;
  List<Datum> photoList = List<Datum>();

  @override
  void initState() {
    bloc.add(GetPhotoGalleryDataEvent(offSet: offSet));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: bloc,
      listener: (BuildContext context, state) {
        if (state is GetPhotoGalleryDataState) {
          list = state.data;
          photoList = state.data.data;
        }
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
                child: isLoading ? circularProgressIndicator : _createListView(),
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
        // if (!isPageLoading) {
        //   isPageLoading = !isPageLoading;
        //   // Perform event when user reach at the end of list (e.g. do Api call)
        // }
        // print("***--- $isPageLoading");
        offSet = list.nextOffset;
        if (offSet != -1) {
          bloc.add(GetPhotoGalleryDataEvent(offSet: offSet));
        }
      }
    });
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
        photoList.length,
        (index) => listItem(
          date: photoList[index].date,
          weight: photoList[index].weight,
          image: photoList[index].userPhoto,
        ),
      ),
    );
  }
}
