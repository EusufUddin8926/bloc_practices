import 'package:counter_bloc/model/favourite_item_model.dart';

class FavouriteRepository {
  Future<List<FavouriteItemModel>> fetchFavouriteList() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavouriteItemModel> _generateList(int length) {
    return List.generate(length, (index) => FavouriteItemModel(id: index.toString(), value: 'item $index'));
  }
}