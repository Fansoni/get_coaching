import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: FlutterLogo(
          colors: Colors.green,
          size: 25.0,
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.grey), onPressed: (){}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.menu, color:Colors.grey), onPressed: (){}),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            alignment: Alignment(0.0, 0.0),
            height: 50.0,
            child: Center(
              child: Text(
                'Get coaching',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, style: BorderStyle.solid),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'YOU HAVE',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 6.0,),
                      Text(
                        '206',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          alignment: Alignment(0.0, 0.0),
                          height: 50.0,
                          width: 100,
                          color: Colors.green.withOpacity(0.2),
                          child: Text(
                            'Buy More',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.0,),
          Container(
            margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'MY COACHES',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'VIEW PAST SESSIONS',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0,),
          Container(
            margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            height: 290,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 4.0,
              shrinkWrap: true,
              children: <Widget>[
                DetailCard(image: 'assets/images/user.png', username: 'C. Brown', status: 'Available',),
                DetailCard(image: 'assets/images/user2.jpg', username: 'Pérola', status: 'Away',),
                DetailCard(image: 'assets/images/user3.jpg', username: 'C4 Pedro', status: 'Away',),
                DetailCard(image: 'assets/images/user.png', username: 'Alyx', status: 'Available',),
                DetailCard(image: 'assets/images/user2.jpg', username: 'Fansoni', status: 'Available',),
                DetailCard(image: 'assets/images/user3.jpg', username: 'Teste', status: 'Away',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  final image;
  final status;
  final username;
  const DetailCard({
    Key key, this.image, this.status, this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 10,),
          Stack(
            children: <Widget>[
              Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  image: DecorationImage(
                    image: AssetImage(image),
                  ),
                ),
              ),
              Container(
                width: 20.0,
                height: 20.0,
                margin: EdgeInsets.only(left: 45.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: (status == 'Available')?Colors.green:Colors.yellow[700],
                  border: Border.all(color: Colors.white, width: 2.0)
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0,),
          Center(
            child: Column(
              children: <Widget>[
                Text(username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                SizedBox(height: 6.0,),
                Text(status,)
              ],
            ),
          ),
          SizedBox(height: 8.0,),
          Expanded(
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                color: (status == 'Available')?Colors.green:Colors.grey
              ),
              child: Center(
                child: Text('Request', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
              ),
            ),
          ),
        ],
      ),
    );
  }
}