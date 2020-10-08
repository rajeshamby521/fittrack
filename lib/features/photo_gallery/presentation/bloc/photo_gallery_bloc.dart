import 'package:fittrack/features/photo_gallery/domain/usecase/photo_gallery_usecase.dart';
import 'package:fittrack/features/photo_gallery/presentation/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoGalleryBloc extends Bloc<PhotoGalleryEvent, PhotoGalleryState> {
  @override
  PhotoGalleryState get initialState => InitialPhotoGalleryState();

  PhotoGalleryDataUseCase photoGalleryDataUseCase;
  PhotoGalleryWeightUseCase weightUseCase;
  PhotoGalleryPhotoUseCase photoUseCase;
  PhotoGalleryDateUseCase dateUseCase;

  PhotoGalleryBloc({
    this.photoGalleryDataUseCase,
    this.dateUseCase,
    this.weightUseCase,
    this.photoUseCase,
  });

  @override
  Stream<PhotoGalleryState> mapEventToState(PhotoGalleryEvent event) async* {
    if (event is GetPhotoGalleryDataEvent) {
      yield LoadingBeginHomeState();
      final result = await photoGalleryDataUseCase(PhotoGalleryDataParams(offSet: event.offSet));
      yield LoadingEndHomeState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => GetPhotoGalleryDataState(data: success),
      );
    }

    if (event is GetPhotoGalleryPhotoEvent) {
      yield LoadingBeginHomeState();
      final result = await photoUseCase(PhotoGalleryPhotoParams(image: event.image));
      yield LoadingEndHomeState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => GetPhotoGalleryPhotoState(image: success),
      );
    }
    if (event is GetPhotoGalleryWeightEvent) {
      yield LoadingBeginHomeState();
      final result = await weightUseCase(PhotoGalleryWeightParams(weight: event.weight));
      yield LoadingEndHomeState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => GetPhotoGalleryWeightState(weight: success),
      );
    }
    if (event is GetPhotoGalleryDateEvent) {
      yield LoadingBeginHomeState();
      final result = await dateUseCase(PhotoGalleryDateParams(dateTime: event.dateTime));
      yield LoadingEndHomeState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => GetPhotoGalleryDateState(dateTime: success),
      );
    }
  }
}
