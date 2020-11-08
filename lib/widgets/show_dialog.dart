import 'package:covid19_tracker_cmr/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShowAlertDialog extends StatelessWidget {
  final TextStyle _linkStyle = TextStyle(
    color: blueBackground,
  );
  Future _launchEmail({@required String email}) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Contact Developer',
    );
    var url = params.toString();
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Covid19 Tracker'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Developers :'),
          Text('Nkwelle Kevin Karin'),
          Text('Email :'),
          InkWell(
            onTap: () {
              _launchEmail(email: 'kevinkarin06@gmail.com');
            },
            child: Text(
              'kevinkarin06@gmail.com',
              style: _linkStyle,
            ),
          ),
          Text('Etoundi Oyono Georges Levy'),
          Text('Email :'),
          InkWell(
            onTap: () {
              _launchEmail(email: 'egeorgeslevy@gmail.com');
            },
            child: Text(
              'egeorgeslevy@gmail.com',
              style: _linkStyle,
            ),
          ),
          Text('Source Code :'),
          Text(
            'Link to git hub',
            style: _linkStyle,
          ),
        ],
      ),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'OK',
            style: TextStyle(
              color: blueBackground,
              fontSize: 16,
            ),
          ),
        ),
      ],
      contentPadding: EdgeInsets.all(10.0),
    );
  }
}
