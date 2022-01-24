import 'package:flutter/material.dart';
import '../../core/services/auth.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Auth auth;

  bool isAuthenticated = false;

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text('Page title'),
          actions: [
            Icon(Icons.favorite),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.search),
            ),
            Icon(Icons.more_vert),
          ],
        ),
        // drawer: MediaQuery.of(context).size.width < 500
        //     ? Drawer(
        //         child: Menu(),
        //       )
        //     : null,
        body: SafeArea(
            child: Center(
                child: MediaQuery.of(context).size.width < 500
                    ? Row(children: [
                        Container(width: 200.0, child: Menu()),
                        Container(
                            width: MediaQuery.of(context).size.width - 200.0,
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ))
                      ])
                    : Content())));
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(context) => ListView(children: [
        FlatButton(
            onPressed: () {},
            child: ListTile(
              leading: Icon(Icons.looks_one),
              title: Text("First Link"),
            )),
        FlatButton(
            onPressed: () {},
            child: ListTile(
              leading: Icon(Icons.looks_two),
              title: Text("Second Link"),
            ))
      ]);
}

class Content extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
      child: Text('Dashboard'),
    );
  }
}
