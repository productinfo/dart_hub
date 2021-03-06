import 'package:dart_hub/model/user.dart';
import 'package:dart_hub/interactor/paginator/user_paginator.dart';
import 'package:dart_hub/ui/paginated_list_screen.dart';
import 'package:dart_hub/ui/tiles/user_tile.dart';
import 'package:flutter/material.dart';

class FollowingScreen extends StatelessWidget {

  final FollowingPaginatorFactory _paginatorFactory;
  final String _username;

  FollowingScreen(this._paginatorFactory, this._username);

  @override
  Widget build(BuildContext context) {
    return new PaginatedListScreen<User>(
      title: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(_username),
            new Text('Following', style: new TextStyle(fontSize: 12.0))
          ]
      ),
      paginatorFactory: _paginatorFactory,
      itemBuilder: _buildFollowerTile,
    );
  }

  Widget _buildFollowerTile(BuildContext context, User user) {
    return new UserTile(user);
  }
}
