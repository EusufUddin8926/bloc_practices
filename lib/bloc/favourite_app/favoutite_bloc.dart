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
    on<FavouriteItem>(_addFavouriteItem);
  }

  void _fetchList(FetchFavouriteList event, Emitter<FavouriteItemStates> emit) async {
    favouriteItemList = await favouriteRepository.fetchFavouriteList();
    emit(state.copyWith(favouiteItemList: List.from(favouriteItemList), listStatus: ListStatus.success));
  }

  void _addFavouriteItem(FavouriteItem event, Emitter<FavouriteItemStates> emit) async {
    int index = favouriteItemList.indexWhere((element) => element.id == event.favouriteItemModel.id);
    favouriteItemList[index] = event.favouriteItemModel;
    emit(state.copyWith(favouiteItemList: List.from(favouriteItemList)));
  }
}
