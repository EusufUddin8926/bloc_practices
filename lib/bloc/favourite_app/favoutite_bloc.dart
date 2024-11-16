import 'package:bloc/bloc.dart';
import 'package:counter_bloc/bloc/favourite_app/favourite_state.dart';
import 'package:counter_bloc/model/favourite_item_model.dart';
import 'package:counter_bloc/repository/FavouriteRepository.dart';

import 'favourite_event.dart';

class FavouriteItemBloc extends Bloc<FavouriteEvents, FavouriteItemStates> {
  List<FavouriteItemModel> favouriteItemList = [];
  List<FavouriteItemModel> temFavouriteItemList = [];
  FavouriteRepository favouriteRepository;

  FavouriteItemBloc(this.favouriteRepository) : super(const FavouriteItemStates()) {
    on<FetchFavouriteList>(_fetchList);
    on<FavouriteItem>(_addFavouriteItem);
    on<SelectItemEvent>(_selectItemEvent);
    on<UnSelectItemEvent>(_unSelectItemEvent);
    on<DeleteEvent>(_deleteItem);
  }

  void _fetchList(FetchFavouriteList event, Emitter<FavouriteItemStates> emit) async {
    favouriteItemList = await favouriteRepository.fetchFavouriteList();
    emit(state.copyWith(favouiteItemList: List.from(favouriteItemList), listStatus: ListStatus.success));
  }

  void _addFavouriteItem(FavouriteItem event, Emitter<FavouriteItemStates> emit) async {
    int index = favouriteItemList.indexWhere((element) => element.id == event.favouriteItemModel.id);

    if (event.favouriteItemModel.isFavourite) {
      if (temFavouriteItemList.contains(favouriteItemList[index])) {
        temFavouriteItemList.remove(favouriteItemList[index]);
        temFavouriteItemList.add(event.favouriteItemModel);
      }
    } else {
      if (temFavouriteItemList.contains(favouriteItemList[index])) {
        temFavouriteItemList.remove(favouriteItemList[index]);
        temFavouriteItemList.add(event.favouriteItemModel);
      }
    }

    favouriteItemList[index] = event.favouriteItemModel;
    emit(state.copyWith(
        favouiteItemList: List.from(favouriteItemList), temfavouiteItemList: List.from(temFavouriteItemList)));
  }

  void _selectItemEvent(SelectItemEvent event, Emitter<FavouriteItemStates> emit) async {
    temFavouriteItemList.add(event.favouriteItemModel);
    emit(state.copyWith(temfavouiteItemList: List.from(temFavouriteItemList)));
  }

  void _unSelectItemEvent(UnSelectItemEvent event, Emitter<FavouriteItemStates> emit) async {
    temFavouriteItemList.remove(event.favouriteItemModel);
    emit(state.copyWith(temfavouiteItemList: List.from(temFavouriteItemList)));
  }

  void _deleteItem(DeleteEvent event, Emitter<FavouriteItemStates> emit) async {
    for (int i = 0; i < temFavouriteItemList.length; i++) {
      favouriteItemList.remove(temFavouriteItemList[i]);
    }

    temFavouriteItemList.clear();
    emit(state.copyWith(
        favouiteItemList: List.from(favouriteItemList), temfavouiteItemList: List.from(temFavouriteItemList)));
  }
}
