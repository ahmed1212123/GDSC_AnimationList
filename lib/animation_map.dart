import 'package:flutter/material.dart';

class AnimationMap extends StatefulWidget {
  const AnimationMap({Key? key}) : super(key: key);

  @override
  State<AnimationMap> createState() => _AnimationMapState();
}

class _AnimationMapState extends State<AnimationMap> {

  List<String> _list = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height/8,
          title: Center(
            child: Text('Flutter Map'),
          ),
        ),
        body: ListView(
          children:
            [
              Container(
                height: height/12,
                child: OutlinedButton(
                  onPressed: () {
                    _addItem();
                  },
                  child: Icon(Icons.add , color: Colors.white,size: 25,),
                ),
              ),
              Container(
                height: 800,
                child: AnimatedList(
                  key: _listKey,
                  initialItemCount: _list.length,
                  itemBuilder: (context, index, animation) {
                    return _buildItem(_list[index], index, animation);
                  },
                ),
              )
            ],
          ),
    );
  }

  Widget _buildItem(String item, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        color: Colors.amber,
        elevation: 2,
        child: ListTile(
          title: Text(
            item,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          trailing: IconButton(
            onPressed: () {
              _removeItem(index);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  void _removeItem(int i) {
    String removeItem = _list.removeAt(i);
    builder(context, animation) {
      return _buildItem(removeItem, i, animation);
    }

    _listKey.currentState!.removeItem(i, builder);
  }
  void _addItem(){
    int i = _list.length>0 ? _list.length : 0;
    _list.insert(i, 'item ${_list.length+1}');
    _listKey.currentState!.insertItem(i);
  }
}


