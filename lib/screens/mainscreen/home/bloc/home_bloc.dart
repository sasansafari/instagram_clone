import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tec/data/repo/post_repo.dart';
import 'package:tec/data/repo/story_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IPostRepo iPostRepo;
  final IStoryRepo iStoryRepo;


  HomeBloc({required this.iPostRepo,required this.iStoryRepo}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
