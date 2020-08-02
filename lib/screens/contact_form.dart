import 'package:flutter/material.dart';
import 'package:iiitdmjcompanion/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final formKey = GlobalKey<FormState>();
  Future<void> _launched;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
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
          children: <Widget>[
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: CircleAvatar(
                    radius: size.height * 0.045,
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
              'Contact Us',
              style: TextStyle(
                color: kBackgroundColor,
                fontSize: size.height * 0.050,
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
              height: size.height * 0.03,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _launched =
                      _launchInBrowser("mailto:iiitdmjcompanion@gmail.com");
                });
              },
              child: Container(
                height: size.height * 0.11,
                width: size.width,
                margin: EdgeInsets.all(size.height * 0.03),
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Send us a Mail',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.030,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _launched = _launchInBrowser(
                      "https://github.com/SMV-IIITDMJ/iiitdmj-companion-issues/issues/new");
                });
              },
              child: Container(
                height: size.height * 0.11,
                width: size.width,
                margin: EdgeInsets.all(size.height * 0.03),
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Create an Issue on GitHub',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height * 0.030,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
