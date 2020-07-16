import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/constants.dart';

class MessMenuScreen extends StatefulWidget {
  @override
  _MessMenuScreenState createState() => _MessMenuScreenState();
}

class _MessMenuScreenState extends State<MessMenuScreen> {
  List items = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  List breakfast = [
    'Vada-Pav, Sambhar, Chutney, Sprouts, Toast, Tea, Butter, Milk',
    'Pasta, Chutney, Sprouts, Toast, Tea, Butter, Milk',
    'Uttapam, Nariyal Chutney, Sprouts, Toast, Tea, Butter, Milk',
    'Halwa, Chane, Sprouts, Toast, Tea, Butter, Milk',
    'Methi Parathe, Chutney, Sprouts, Toast, Tea, Butter, Milk',
    'Dosa, Sambhar, Chutney, Sprouts, Toast, Tea, Butter, Milk',
    'Aaloo Paratha, Chutney, Sprouts, Toast, Tea, Butter, Milk'
  ];
  List lunch = [
    'Chhole-Bhatoore, Raita, Roti, Rice, Dal, Salad',
    'Dal, Sabji, Roti, Rice, Salad',
    'Chhole-Bhatoore, Raita, Roti, Rice, Dal, Salad',
    'Halwa, Chane, Sprouts, Toast, Tea, Butter, Milk',
    'Chhole-Bhatoore, Raita, Roti, Rice, Dal, Salad',
    'Dosa, Sambhar, Chutney, Sprouts, Toast, Tea, Butter, Milk',
    'Chhole-Bhatoore, Raita, Roti, Rice, Dal, Salad'
  ];
  List dinner = [
    'Dal, Roti, Rice, Dal, Salad',
    'Dal, Sabji, Pulao, Rice, Salad',
    'Chhole-Bhatoore, Raita, Roti, Rice, Dal, Salad',
    'Halwa, Chane, Sprouts, Toast, Tea, Butter, Milk',
    'Chhole-Bhatoore, Dahi, Roti, Rice, Dal, Salad',
    'Dosa, Sambhar, Chutney, Sprouts, Toast, Tea, Butter, Milk',
    'Chhole-Bhatoore, Raita, Roti, Rice, Dal, Salad'
  ];

  String breakfastText;
  String lunchText;
  String dinnerText;

  int _index = 0;

  @override
  void initState() {
    breakfastText = breakfast[_index];
    lunchText = lunch[_index];
    dinnerText = dinner[_index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      color: kBackgroundColor,
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
              'MESS MENU',
              style: TextStyle(
                color: kBackgroundColor,
                fontSize: size.height * 0.05,
                fontWeight: FontWeight.w600,
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
                child: MessSwipeableCards(),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              height: size.height * 0.55,
              width: size.width - 60,
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Breakfast',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                decoration: TextDecoration.underline),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            breakfastText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 50, right: 50, bottom: 10),
                            child: Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lunch',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                decoration: TextDecoration.underline),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            lunchText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 50, right: 50, bottom: 10),
                            child: Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dinner',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                decoration: TextDecoration.underline),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            dinnerText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  PageView MessSwipeableCards() {
    return PageView.builder(
      itemCount: 7,
      onPageChanged: (int index) {
        setState(() {
          breakfastText = breakfast[index];
          lunchText = lunch[index];
          dinnerText = dinner[index];
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
