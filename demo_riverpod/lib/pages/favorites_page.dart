import 'package:demo_riverpod/state/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteData = ref.watch(favoriteListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites page"),
      ),
      body: ListView.builder(
        itemCount: favoriteData.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black, width: 0.2)),
          margin: const EdgeInsets.all(4),
          child: ListTile(
            title: Text(favoriteData[index].title),
            subtitle: Text(favoriteData[index].id.toString()),
            trailing: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(favoriteData[index].thumbnailUrl),
            ),
          ),
        ),
      ),
    );
  }
}
