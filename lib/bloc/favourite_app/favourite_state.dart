import 'package:counter_bloc/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavouriteItemStates extends Equatable {
  final ListStatus listStatus;
  final List<FavouriteItemModel> favouiteItemList;

  const FavouriteItemStates({
    this.favouiteItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavouriteItemStates copyWith({List<FavouriteItemModel>? favouiteItemList, ListStatus? listStatus}) {
    return FavouriteItemStates(
        favouiteItemList: favouiteItemList ?? this.favouiteItemList, listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object?> get props => [favouiteItemList, listStatus];
}
