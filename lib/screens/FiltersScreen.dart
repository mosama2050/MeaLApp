import 'package:flutter/material.dart';
import 'package:mealapp/widgets/MainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFiltter;
  final Map<String, bool> _currentFilters;

  const FiltersScreen(this._currentFilters,this.saveFiltter );

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;


  @override
  initState() {
    super.initState();

    _glutenFree = widget._currentFilters['gluten'];
    _vegetarian = widget._currentFilters['vegetarian'];
    _vegan = widget._currentFilters['vegan'];
    _lactoseFree = widget._currentFilters['lactose'];
  }


  Widget _buildSwitchListTitle(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };

              widget.saveFiltter(selectedFilters);
              Navigator.pop(context);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildSwitchListTitle(
                'Gluten Free',
                'Only include gluten free meals',
                _glutenFree,
                (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTitle(
                'Lactose Free',
                'Only include lactose free meals',
                _lactoseFree,
                (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTitle(
                'Vegan',
                'Only include vegan meals',
                _vegan,
                (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                },
              ),
              _buildSwitchListTitle(
                'Vegetarian',
                'Only include vegetarian meals',
                _vegetarian,
                (newValue) {
                  setState(
                    () {
                      _vegetarian = newValue;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
