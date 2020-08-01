import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Future<void> _launched;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
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
            Text(
              'ABOUT',
              style: TextStyle(
                color: kBackgroundColor,
                fontSize: size.height * 0.048,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                color: kBackgroundColor,
                thickness: 1.2,
              ),
            ),
            SizedBox(
              height: size.height * 0.042,
            ),
            Text(
              'Connections\n'
              'Link Frames together using\n'
              'Connectins. While in prototype\n'
              'mode, select a frame or any child\n'
              'object within a frame',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: kBackgroundColor,
                  fontSize: size.height * 0.03,
                  fontWeight: FontWeight.w300),
            ),
            Spacer(),
            Text(
              'The Team',
              style: TextStyle(
                color: kBackgroundColor,
                fontSize: size.height * 0.043,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              children: [
                Container(
                  height: size.height * 0.11,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: size.width * 0.30,
                        child: Center(
                          child: Text(
                            'Sehej',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Container(
                          width: size.width * 0.40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _launched = _launchInBrowser(
                                        "https://github.com/sehejjain");
                                  });
                                },
                                child: Icon(
                                  LineAwesomeIcons.github,
                                  color: Colors.white,
                                  size: size.height * 0.046,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _launched = _launchInBrowser(
                                      "https://www.instagram.com/sehej.on.the.offbeat/",
                                    );
                                  });
                                },
                                child: Icon(
                                  LineAwesomeIcons.instagram,
                                  color: Colors.white,
                                  size: size.height * 0.046,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _launched = _launchInBrowser("");
                                  });
                                },
                                child: Icon(
                                  LineAwesomeIcons.linkedin,
                                  color: Colors.white,
                                  size: size.height * 0.046,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        width: size.width * 0.15,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.021,
            ),
            Row(
              children: [
                Spacer(),
                Container(
                  height: size.height * 0.11,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.15,
                      ),
                      Container(
                          width: size.width * 0.40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _launched = _launchInBrowser(
                                      "https://www.linkedin.com/in/manish-pandey-8a4213179/",
                                    );
                                  });
                                },
                                child: Icon(
                                  LineAwesomeIcons.linkedin,
                                  color: Colors.white,
                                  size: size.height * 0.046,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _launched = _launchInBrowser(
                                      "https://www.instagram.com/_.wubba_lubba_dub_dub/",
                                    );
                                  });
                                },
                                child: Icon(
                                  LineAwesomeIcons.instagram,
                                  color: Colors.white,
                                  size: size.height * 0.046,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _launched = _launchInBrowser(
                                        "https://github.com/manishpandeyvp");
                                  });
                                },
                                child: Icon(
                                  LineAwesomeIcons.github,
                                  color: Colors.white,
                                  size: size.height * 0.046,
                                ),
                              ),
                            ],
                          )),
                      Container(
                        width: size.width * 0.30,
                        child: Center(
                          child: Text(
                            'Manish',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.021,
            ),
            Row(
              children: [
                Container(
                  height: size.height * 0.11,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: size.width * 0.30,
                        child: Center(
                          child: Text(
                            'Vishnu',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      Container(
                          width: size.width * 0.40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _launched = _launchInBrowser(
                                        "https://behance.net/therealvishnur");
                                  });
                                },
                                child: Icon(
                                  LineAwesomeIcons.behance,
                                  color: Colors.white,
                                  size: size.height * 0.046,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _launched = _launchInBrowser(
                                        "https://instagram.com/therealvishnur");
                                  });
                                },
                                child: Icon(
                                  LineAwesomeIcons.instagram,
                                  color: Colors.white,
                                  size: size.height * 0.046,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _launched = _launchInBrowser(
                                        "https://dribbble.com/therealvishnur");
                                  });
                                },
                                child: Icon(
                                  LineAwesomeIcons.dribbble,
                                  color: Colors.white,
                                  size: size.height * 0.046,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        width: size.width * 0.15,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.021,
            ),
          ],
        ),
      ),
    );
  }
}
