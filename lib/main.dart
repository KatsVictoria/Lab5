import 'package:flutter/material.dart';

class MyCalulateArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyCalulateAreaState();
}

class MyCalulateAreaState extends State<MyCalulateArea> {
  final _formKey = GlobalKey<FormState>();
  var _width;
  var _height;
  var _area;

  Widget build(BuildContext context) {
    return new Form(key: _formKey, child: new Column(
        children: [
          new Row(children: <Widget>[
            new Container(padding:EdgeInsets.all(10.0),child: new Text('Ширина (мм):')),
            new Expanded(child: Container(padding:EdgeInsets.all(10.0),child:
            new TextFormField(validator: (value){
              if (value!.isEmpty) return 'Задайте Ширину';

              try {
                _width = int.parse(value);
              } catch(e) {
                _width = null;
                return e.toString();
              }
            })
            )),
          ]
          ),

          new SizedBox(height: 10.0),

          new Row(children: <Widget>[
            new Container(padding:EdgeInsets.all(10.0),child: new Text('Высота (мм):')),
            new Expanded(child: Container(padding:EdgeInsets.all(10.0),child:
            new TextFormField(validator: (value){
              if (value!.isEmpty) return 'Задайте Высоту';

              try {
                _height = int.parse(value);
              } catch(e) {
                _height = null;
                return e.toString();
              }
            })
            )),
          ]
          ),

          new SizedBox(height: 10.0),

          new RaisedButton(onPressed: (){
            if(_formKey.currentState!.validate()) {
              setState(() {
                if (_width is int && _height is int) _area = _width * _height;
              });
            }
          }, child: Text('Вычислить'), color: Colors.blue, textColor: Colors.white,),

          new SizedBox(height: 50.0),

          new Text(_area == null ? 'задайте параметры' : 'S = $_width * $_height = ${_area} (мм2)', style: TextStyle(fontSize: 30.0),)
        ]
    ));
  }
}

void main() => runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(title: new Text('Калькулятор площади')),
            body: new MyCalulateArea()
        )
    )
);