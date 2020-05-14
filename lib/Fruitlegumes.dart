import 'package:flutter/material.dart';
class Fruitlegumes extends StatefulWidget{
  @override
  _FruitlegumesState createState() => _FruitlegumesState();
}
class _FruitlegumesState extends State<Fruitlegumes> {
  var champs = ["animal","capital","fruit", "legume","metier","pays"];
  var i = 0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:  
        SafeArea(
          child: SingleChildScrollView(
              child: Container(
                child: Column(children: <Widget>[
                  Container(
                    height: 410,
                    width: double.infinity,
                    decoration: new BoxDecoration(
                      color: Color(0xfff8ce46),
                      borderRadius: new BorderRadius.only(
                        bottomLeft:const Radius.circular(120.0),
                        bottomRight:const Radius.circular(120.0),
                      )
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Transform.rotate(
                                  angle: 45,
                                  child:     
                                  Icon(
                                    Icons.play_arrow,
                                    color: Color(0xfff8ce46),
                                    size: 36.0,
                                  ),                 
                                ),
                              ),
                            ),
                            Center(
                              child: Row(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text("00:05", style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                                ),
                              ],),
                            )
                          ]
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:10.0),
                          child: Container(
                            height: 80,
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5.0,
                                          spreadRadius: 2),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5.0,
                                                spreadRadius: 2
                                              ),
                                            ],
                                          ),
                                          child: Icon(Icons.check_circle,
                                          color: Colors.green, size: 40)
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5.0,
                                                spreadRadius: 2
                                              ),
                                            ],
                                          ),
                                          child: Icon(Icons.check_circle,
                                          color: Colors.green, size: 40)
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5.0,
                                                spreadRadius: 2
                                              ),
                                            ],
                                          ),
                                          child: Icon(Icons.check_circle,
                                          color: Colors.green, size: 40)
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5.0,
                                                spreadRadius: 2
                                              ),
                                            ],
                                          ),
                                          child: Icon(Icons.check_circle,
                                          color: Colors.green, size: 40)
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 5.0,
                                                  spreadRadius: 2
                                                ),
                                              ],
                                            ),
                                            child: Icon(Icons.brightness_1,
                                            color: Colors.white, size: 40)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5.0,
                                                spreadRadius: 2),
                                            ],
                                          ),
                                          child: Icon(Icons.brightness_1,
                                          color: Colors.white, size: 40)
                                        ),
                                      ),
                                    ],
                                  )
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top:30,left:20),
                              child: Text("Lettre is: B", style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                            ),
                              Padding(
                              padding: const EdgeInsets.only(top:25,right:20),
                                child: Text("5/6", style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                              ),
                          ]
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Container(
                            child:  Text('${champs[i]}',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:10,left:20),
                          child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2, // 20%
                                    child:  RaisedButton(
                                      color: Colors.white,
                                      onPressed: previous,
                                      child: Icon(
                                        Icons.skip_previous,
                                        color: Color(0xfff8ce46),
                                        size: 40.0,
                                      ),
                                      shape: CircleBorder(),
                                    ),                             
                                  ),
                                  Expanded(
                                    flex: 6, // 60%
                                    child: Center(
                                      child: CircleAvatar(
                                        radius: 60.0,
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage("images/"+'${champs[i]}'+".jpg"),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3, // 20%
                                    child:  RaisedButton(
                                      color: Colors.white,
                                      onPressed: next,
                                      child: Icon(
                                        Icons.skip_next,
                                        color: Color(0xfff8ce46),
                                        size: 40.0,
                                      ),
                                      shape: CircleBorder(),
                                    ),
                                  )
                                ],
                              ),
                        )
                        /*
                        Padding(
                          padding: const EdgeInsets.only(top:25),
                          child: Container(child:
                          Center(
                            child: 
                            Text('${champs[i]}',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)
                          ),
                          ),
                        ),*/
                        /*
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                              color: Colors.white,
                              onPressed: previous,
                              child: Icon(
                                Icons.skip_next,
                                color: Color(0xfff8ce46),
                                size: 45.0,
                              ),
                              shape: CircleBorder(),
                            ), 
                            Padding(
                              padding: const EdgeInsets.only(top:5),
                              child: CircleAvatar(
                                radius: 70.0,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage("images/"+'${champs[i]}'+".jpg"),
                              ),
                            ),
                            RaisedButton(
                              color: Colors.white,
                              onPressed: next,
                              child: Icon(
                                Icons.skip_next,
                                color: Color(0xfff8ce46),
                                size: 45.0,
                              ),
                              shape: CircleBorder(),
                            ), 
                          ],
                        ),
                      */
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: Container(
                width: 200.0,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)
                    ),
                    hintText: 'B########'
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40,top:15),
              child: Container(
                child: Text("Vous devez saisir un "+'${champs[i]}'+" qui commance par la lettre B",style: TextStyle(fontSize: 18,color: Colors.grey,fontWeight: FontWeight.bold),)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Container(
              color: Color(0xfff3bc0a),
              width: 200,
              height: 40,
              child: RaisedButton(
                onPressed: null,
                child: Text(
                  'Validé',
                  style: TextStyle(fontSize: 20,color: Colors.white)
                ),
              ),
              ),
            ),
      ],),
  ),
  ),
  ),
  );
  }
  void next() {
    setState(() {
      if(i<5){
        ++i;
      }
    });
  }

  void previous() {
    setState(() {
      if(i>0){
        --i;
      }
    });
  }
}