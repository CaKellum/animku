import 'package:animku/environments/dictionary.dart';
import 'package:animku/environments/my_fonts.dart';
import 'package:animku/ui/drawerList/about_screen.dart';
import 'package:animku/ui/drawerList/current_season_screen.dart';
import 'package:animku/ui/drawerList/schedule_screen.dart';
import 'package:animku/ui/drawerList/search_anime_screen.dart';
import 'package:animku/ui/drawerList/season_later_screen.dart';
import 'package:animku/ui/scheduleScreen/sunday_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget {
  final bool selected;

  const MyDrawer({Key key, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            _header(),
            _drawerItems(
              leading: Icon(FontAwesomeIcons.calendarCheck),
              text: Text('This Season'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTapTabbed: (){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => CurrentSeasonScreen()),
                    (Route<dynamic> route) => false);
              }
            ),
            _drawerItems(
                leading: Icon(FontAwesomeIcons.calendarAlt),
                text: Text('Season Later'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTapTabbed: (){
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SeasonLaterScreen()),
                          (Route<dynamic> route) => false);
                }
            ),
            _drawerItems(
                leading: Icon(Icons.date_range),
                text: Text('Schedule'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTapTabbed: (){
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => ScheduleScreen()),
                          (Route<dynamic> route) => false);
                }
            ),
            _drawerItems(
                leading: Icon(FontAwesomeIcons.search),
                text: Text('Search Anime'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTapTabbed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchAnimeScreen(),fullscreenDialog: true));
                }
            ),
            Divider(),
            _drawerItems(
              leading: Icon(FontAwesomeIcons.infoCircle),
              text: Text('About'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTapTabbed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));

              }
            )
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Dictionary.tenkinokowp),
            fit: BoxFit.cover
          )
        ),
        child: Stack(
            children: <Widget>[
              Positioned(
                  bottom: 12.0,
                  left: 16.0,
                  child: Text("ANIMKU",
                      style: TextStyle(
                        fontFamily: MyFonts.horizon,
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500))),
        ]));
  }
  Widget _drawerItems({leading,trailing,text,onTapTabbed}){
    return ListTile(
      leading: leading,
      title: text,
      trailing: trailing,
      onTap: onTapTabbed,
    );
  }
}
