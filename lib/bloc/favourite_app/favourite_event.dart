import 'package:counter_bloc/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteEvents extends Equatable {
  const FavouriteEvents();

  @override
  List<Object?> get props => [];
}

class FetchFavouriteList extends FavouriteEvents {}

class FavouriteItem extends FavouriteEvents {
  final FavouriteItemModel favouriteItemModel;

  const FavouriteItem({required this.favouriteItemModel});
}
