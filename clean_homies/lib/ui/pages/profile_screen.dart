import 'package:flutter/material.dart';
import 'package:clean_homies/counter.dart';
import 'package:clean_homies/model/facts.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          child: BottomNavigationBar(
            iconSize: 40,
            selectedIconTheme: IconThemeData(
              color: const Color(0xFF2d6a4f),
            ),
            unselectedIconTheme: IconThemeData(color: const Color(0xFF95d5b2)),
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(Icons.home),
                  ),
                  title: Text(
                    "Home",
                    style: const TextStyle(color: Colors.white),
                  )),
              BottomNavigationBarItem(
                icon: Padding(
                  child: Icon(Icons.favorite),
                  padding: const EdgeInsets.only(top: 8.0),
                ),
                title: Text(
                  "Search",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  child: Icon(Icons.person),
                  padding: const EdgeInsets.only(top: 8.0),
                ),
                title: Text(
                  "Profile",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          )),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              height: height * 0.38,
              left: 0,
              right: 0,
              child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: const Radius.circular(40),
                  ),
                  child: Container(
                    color: Colors.white,
                    child: GermCounter(),
                  ))),
          Positioned(
            top: height * 0.38,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8,
                      left: 32,
                      right: 16,
                    ),
                    child: Text(
                      "FACTS MUST KNOW",
                      style: const TextStyle(
                        color: const Color(0xFF1b4332),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 32,
                          ),
                          for (int i = 0; i < facts.length; i++)
                            _FactCard(fact: facts[i]),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 10, left: 32, right: 32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            const Color(0xFFe00a1f),
                            const Color(0xFFe07a5f),
                          ],
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Text("UNIMPLEMENTED"),
                          Text("NOT TEST"),
                          Row(
                            children: <Widget>[
                              // IconButton(icon: Image.asset("")),
                              Text('hi'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//fact card
class _FactCard extends StatelessWidget {
  final Fact fact;

  const _FactCard({Key key, @required this.fact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  fact.imagePath,
                  width: 100,
                  //posible height
                  fit: BoxFit.fitHeight,
                ), // possible error
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      fact.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: const Color(0xFF3d405b),
                      ),
                    ),
                    Text(
                      fact.factText,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: const Color(0xFFe07a5f),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
