import 'dart:async';
import 'package:dart_hub/model/event.dart';
import 'package:dart_hub/interactor/paginator/event_paginator.dart';
import 'package:dart_hub/ui/tiles/event_tile.dart';
import 'package:dart_hub/ui/paginated_list/paginated_list_view.dart';
import 'package:flutter/material.dart';

class EventsView extends StatefulWidget {

  final ReceivedEventsPaginatorFactory _paginatorFactory;
  final String _username;

  EventsView(this._paginatorFactory, this._username);

  @override
  State<StatefulWidget> createState() =>
      new _FeedViewState(_paginatorFactory, _username);
}

class _FeedViewState extends State<EventsView> {

  final ReceivedEventsPaginatorFactory _paginatorFactory;
  final String _username;

  EventsPaginator _paginator;

  _FeedViewState(this._paginatorFactory, this._username);

  @override
  void initState() {
    super.initState();
    _paginator = _paginatorFactory.buildPaginator();
  }

  Future _refresh() async {
    setState(() {
      _paginator = _paginatorFactory.buildPaginator();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
        onRefresh: _refresh,
        child: new PaginatedListView<Event>(
          paginator: _paginator,
          itemBuilder: (BuildContext context, Event event) => new EventTile(event)
        )
    );
  }
}