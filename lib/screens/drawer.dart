import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:two_blocks/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  // bool _themeSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 100,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/two_blocks_launcher.png"))),
                    ),
                    Text(
                      ' Blocks',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.purpleAccent.shade700,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                decoration: BoxDecoration(color: Constants.BGColor, boxShadow: [
                  BoxShadow(
                      color: Constants.DarkShadow,
                      offset: Offset(0, 1),
                      blurRadius: 1,
                      spreadRadius: 0)
                ]),
              ),
              ListTile(
                title: Text('Privacy policy'),
                leading: Icon(
                  Icons.info_outline,
                  color: Colors.deepPurple.shade900,
                ),
                onTap: launchPrivacyPolicy,
              ),
              ListTile(
                title: Text('Help'),
                leading: Icon(
                  Icons.help_outline,
                  color: Colors.deepPurple.shade900,
                ),
                onTap: launchHelp,
              ),
              ListTile(
                title: Text('Share'),
                leading: Icon(
                  Icons.share,
                  color: Colors.deepPurple.shade900,
                ),
                onTap: shareApp,
              ),
              // ListTile(
              //   title: Text('Dark Theme'),
              //   leading: Icon(
              //     Icons.brightness_3,
              //     color: Colors.deepPurple.shade900,
              //   ),
              //   trailing: Switch(
              //     value: _themeSwitch,
              //     onChanged: (val) {
              //       _themeSwitch = val;
              //       setState(() {});
              //     },
              //   ),
              // )
            ],
          ),
          ListTile(
            title: Text('Report a bug'),
            leading: Icon(
              Icons.bug_report,
              color: Colors.deepPurple.shade900,
            ),
            onTap: launchBugReportingApp,
          )
        ],
      ),
    );
  }

  void launchBugReportingApp() async {
    String phone = "+917011205822";
    String message = "Hey, I have found a bug.";
    String url = "whatsapp://send?   phone=$phone&text=${Uri.parse(message)}";
    Navigator.of(context).pop();

    if (!await canLaunch(url)) {
      launchEmail();
      return;
    }
    await launch(url);
  }

  void launchPrivacyPolicy() async {
    String url = "https://bit.ly/32aQamv";

    Navigator.of(context).pop();
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void launchEmail() async {
    String emailAddress = "agneeapps@gmail.com";
    String subject = "I+have+found+a+bug";
    String emailUrl = "mailto:$emailAddress?subject=$subject";

    if (!await canLaunch(emailUrl)) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Either something went wrong or you don't have any app that you can to contact us."),
        ),
      );
      return;
    }
    await launch(emailUrl);
  }

  void shareApp() async {
    Navigator.of(context).pop();
    final url = "https://bit.ly/304Oqsz";
    try {
      Share.text(
          "",
          "Hey I am have found this interesting maths app. This app is awesome, try it $url",
          "text/plain");
    } catch (e) {
      print(e);
    }
  }

  void launchHelp() async {
    String url = "https://bit.ly/2DAJAf5";
    Navigator.of(context).pop();
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
