import 'dart:developer';

import 'package:demo_riverpod/pages/favorites_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/providers.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photosData = ref.watch(photoStateFuture);
    final favList = ref.read(favoriteListProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod api demo "),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (_) => const FavoritePage()));
              },
              icon: const Icon(Icons.favorite_rounded))
        ],
      ),
      body: photosData.when(
          data: (photosData) {
            return ListView.builder(
                itemCount: photosData.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        if (!favList.state.contains(photosData[index])) {
                          favList.addToFavoritesList(photosData[index]);
                          const snackBar = SnackBar(
                            content: Text('Added to favorites!'),
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 1),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Already added to favorites!'),
                            behavior: SnackBarBehavior.floating,
                            duration: Duration(seconds: 2),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: Colors.black, width: 0.2)),
                        margin: const EdgeInsets.all(4),
                        child: ListTile(
                          title: Text(photosData[index].title),
                          subtitle: Text(photosData[index].id.toString()),
                          trailing: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                NetworkImage(photosData[index].thumbnailUrl),
                          ),
                        ),
                      ),
                    ));
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
