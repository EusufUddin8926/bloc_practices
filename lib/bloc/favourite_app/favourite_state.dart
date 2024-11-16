import 'package:counter_bloc/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavouriteItemStates extends Equatable {
  final ListStatus listStatus;
  final List<FavouriteItemModel> favouiteItemList;
  final List<FavouriteItemModel> temfavouiteItemList;

  const FavouriteItemStates({
    this.favouiteItemList = const [],
    this.temfavouiteItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavouriteItemStates copyWith(
      {List<FavouriteItemModel>? favouiteItemList,
      List<FavouriteItemModel>? temfavouiteItemList,
      ListStatus? listStatus}) {
    return FavouriteItemStates(
        favouiteItemList: favouiteItemList ?? this.favouiteItemList,
        temfavouiteItemList: temfavouiteItemList ?? this.temfavouiteItemList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object?> get props => [favouiteItemList, temfavouiteItemList, listStatus];
}
