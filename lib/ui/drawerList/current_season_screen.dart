import 'package:animku/bloc/current_season_bloc/current_bloc_event.dart';
import 'package:animku/bloc/current_season_bloc/fall_bloc.dart';
import 'package:animku/bloc/current_season_bloc/spring_bloc.dart';
import 'package:animku/bloc/current_season_bloc/summer_bloc.dart';
import 'package:animku/bloc/current_season_bloc/winter_bloc.dart';
import 'package:animku/bloc/schedule_bloc/monday_bloc.dart';
import 'package:animku/bloc/schedule_bloc/shedule_event_state.dart';
import 'package:animku/bloc/seasonLaterBloc/season_later_bloc.dart';
import 'package:animku/components/bottom_navbar.dart';
import 'package:animku/repository/search_anime_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CurrentSeasonScreen extends StatefulWidget {
  @override
  _CurrentSeasonScreenState createState() => _CurrentSeasonScreenState();
}

class _CurrentSeasonScreenState extends State<CurrentSeasonScreen> {
  FallBloc fallBloc;
  SpringBloc springBloc;
  SummerBloc summerBloc;
  WinterBloc winterBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    winterBloc = BlocProvider.of<WinterBloc>(context);
    winterBloc.add(FetchCurrentEvent());
    Future.delayed(Duration(seconds: 2),(){
      setState(() {
        springBloc = BlocProvider.of<SpringBloc>(context);
        springBloc.add(FetchCurrentEvent());
        summerBloc = BlocProvider.of<SummerBloc>(context);
        summerBloc.add(FetchCurrentEvent());
        fallBloc = BlocProvider.of<FallBloc>(context);
        fallBloc.add(FetchCurrentEvent());
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavBar();
  }
}
