import 'package:counter_bloc/bloc/favourite_app/favourite_state.dart';
import 'package:counter_bloc/bloc/favourite_app/favoutite_bloc.dart';
import 'package:counter_bloc/model/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favourite_app/favourite_event.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteItemBloc>().add(FetchFavouriteList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo APp"),
      ),
      body: BlocBuilder<FavouriteItemBloc, FavouriteItemStates>(builder: (context, states) {
        switch (states.listStatus) {
          case ListStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case ListStatus.failure:
            return const Text('Something Went Wrong');
          case ListStatus.success:
            return ListView.builder(
              itemCount: states.favouiteItemList.length,
              itemBuilder: (context, index) {
                final item = states.favouiteItemList[index];
                return Card(
                  child: ListTile(
                    title: Text(states.favouiteItemList[index].value.toString()),
                    trailing: InkWell(
                        onTap: () async {
                          FavouriteItemModel favouriteItemModel = FavouriteItemModel(
                              id: states.favouiteItemList[index].id,
                              value: states.favouiteItemList[index].value,
                              isFavourite: states.favouiteItemList[index].isFavourite ? false : true,
                              isDeleting: states.favouiteItemList[index].isDeleting);
                          context.read<FavouriteItemBloc>().add(FavouriteItem(favouriteItemModel: favouriteItemModel));
                        },
                        child: item.isFavourite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline)),
                  ),
                );
              },
            );
        }
      }),
    );
  }
}
