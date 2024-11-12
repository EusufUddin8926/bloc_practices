import 'package:bloc/bloc.dart';
import 'package:counter_bloc/bloc/favourite_app/favourite_state.dart';
import 'package:counter_bloc/model/favourite_item_model.dart';
import 'package:counter_bloc/repository/FavouriteRepository.dart';

import 'favourite_event.dart';

class FavouriteItemBloc extends Bloc<FavouriteEvents, FavouriteItemStates> {
  List<FavouriteItemModel> favouriteItemList = [];
  FavouriteRepository favouriteRepository;

  FavouriteItemBloc(this.favouriteRepository) : super(const FavouriteItemStates()) {
    on<FetchFavouriteList>(_fetchList);
  }

  void _fetchList(FavouriteEvents event, Emitter<FavouriteItemStates> emit) async {
    favouriteItemList = await favouriteRepository.fetchFavouriteList();
    emit(state.copyWith(favouiteItemList: List.from(favouriteItemList), listStatus: ListStatus.success));
  }
}
