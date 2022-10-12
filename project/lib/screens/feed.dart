// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text(
          'Freela'
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
          PopupMenuButton<Text>(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text(
                    'localization.demoNavigationRailFirst,'
                  ),
                ),
                const PopupMenuItem(
                  child: Text(
                    'localization.demoNavigationRailSecond,'
                  ),
                ),
                const PopupMenuItem(
                  child: Text(
                    'localization.demoNavigationRailThird,'
                  ),
                ),
              ];
            },
          )
        ],
      ),
      body: const Center(
        child: Text(
          'Salve'
        ),
      ),
    );
  }
}

