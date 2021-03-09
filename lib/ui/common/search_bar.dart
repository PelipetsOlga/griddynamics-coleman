import 'package:coleman/ui/project_module/project_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SearchBarState();
}

class SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      style: Theme.of(context).textTheme.headline6,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.close),
                onPressed: _controller.clear,
              )
            : null,
        hintText: ProjectResources.searchHint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      maxLines: 1,
    );
  }
}