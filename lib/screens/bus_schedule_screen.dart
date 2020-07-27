import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/constants.dart';
import 'package:iiitdmjcompanion/models/busTT/busTT.dart';
import 'package:iiitdmjcompanion/models/class/class.dart';

class BusScheduleScreen extends StatefulWidget {
  @override
  _BusScheduleScreenState createState() => _BusScheduleScreenState();
}

class _BusScheduleScreenState extends State<BusScheduleScreen> {
  List items = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  int _index = 0;
  List<List<BusTT>> tt = [[], [], [], [], [], [], []];
  @override
  void initState() {
    super.initState();
    getBusTT();
  }

  void getBusTT() async {
    QuerySnapshot query =
        await Firestore.instance.collection('Bus').getDocuments();
    print(query.documents);
    for (var doc in query.documents) {
      CollectionReference db = Firestore.instance
          .collection('Bus')
          .document(doc.documentID)
          .collection('tt');
      QuerySnapshot query2 = await db.getDocuments();
      for (var snap in query2.documents) {
        tt[Class.intDayMap[doc.data['day']]].add(BusTT.fromJson(snap.data));
      }
      tt[Class.intDayMap[doc.data['day']]].sort((a, b) => a.compareTo(b));
    }
    for (var t in tt) {
      t.sort((a, b) => a.compareTo(b));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(tt[6]);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: CircleAvatar(
                    radius: size.height * 0.04,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: kIconColor,
                      size: 23,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              'BUS SCHEDULE',
              style: TextStyle(
                color: kBackgroundColor,
                fontSize: size.height * 0.05,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                color: kBackgroundColor,
                thickness: 1.2,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 80, // card height
                child: busSwipeableCards(),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                  bottom: size.height * 0.02),
              height: size.height * 0.55,
              width: size.width - size.width * 0.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.builder(
                itemCount: tt[_index].length,
                itemBuilder: (context, i) {
                  if (i != (tt[_index].length - 1)) {
                    print(i);
                    return BusScheduleCard(
                      visible: true,
                      size: size,
                      time: tt[_index][i].time,
                      route: tt[_index][i].toFrom,
                    );
                  } else {
                    return BusScheduleCard(
                      visible: false,
                      size: size,
                      time: tt[_index][i].time,
                      route: tt[_index][i].toFrom,
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  PageView busSwipeableCards() {
    return PageView.builder(
      itemCount: 7,
      onPageChanged: (int index) {
        setState(() {
          return _index = index;
        });
      },
      itemBuilder: (_, i) {
        return Transform.scale(
          scale: i == _index ? 0.9 : 0.75,
          child: Card(
            color: kBackgroundColor,
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(
                items[i],
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        );
      },
      controller: PageController(viewportFraction: 0.25),
    );
  }
}

class BusScheduleCard extends StatelessWidget {
  const BusScheduleCard({
    Key key,
    @required this.size,
    @required this.time,
    @required this.route,
    @required this.visible,
  }) : super(key: key);

  final Size size;
  final String time;
  final String route;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: size.height * 0.085,
            width: size.width - size.width * 0.15,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Row(
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.024,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    route,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.024,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: visible,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
              child: Container(
                width: 1.2,
                height: size.height * 0.03,
                color: Colors.white,
                child: VerticalDivider(
                  thickness: 1.2,
                  color: kBackgroundColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
