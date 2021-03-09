import 'package:coleman/ui/common/search_bar.dart';
import 'package:coleman/ui/project_module/project_resources.dart';
import 'package:coleman/ui/ui_helper.dart';
import 'package:flutter/material.dart';

import '../ui_constants.dart';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StackOver();
  }
}

class StackOver extends StatefulWidget {
  @override
  _StackOverState createState() => _StackOverState();
}

class _StackOverState extends State<StackOver>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: UIConstants.materialTheme,
      home: Scaffold(
        appBar: _getAppBar(),
        body: Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              _getTabs(),
              _getSearchBar(context),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [_getLeftTabBarView(), _getRightTabBarView()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      title: Text(ProjectResources.appName),
    );
  }

  Widget _getTabs() {
    return Card(
      elevation: 4,
      child: Container(
        height: 64,
        color: UIConstants.appbarBackground,
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: UIConstants.blue,
              ),
            ),
          ),
          tabs: [_getLeftTab(), _getRightTab()],
        ),
      ),
    );
  }

  Tab _getLeftTab() {
    return Tab(
        child: FittedBox(
      child: Text(
        ProjectResources.suggestedExperts.toUpperCase(),
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headline3,
      ),
    ));
  }

  Tab _getRightTab() {
    return Tab(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FittedBox(
          child: Text(
            ProjectResources.projectExperts.toUpperCase(),
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: UIConstants.blue),
          ),
        ),
        Text(
          ProjectResources.expertsCount,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    ));
  }

  Widget _getLeftTabBarView() {
    return Center(
      child: Text(
        'Place Bid',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _getRightTabBarView() {
    return Center(
      child: Text(
        'Buy Now',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _getSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: SearchBar(),
    );
  }
}