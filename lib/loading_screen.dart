import 'package:film_finder/results_page.dart';
import 'package:flutter/material.dart';
import 'package:film_finder/film.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  //Using a constructor to take in the user's input from the last screen
  LoadingScreen(this.userInput);
  final String userInput;

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    var filmData = getFilm(widget.userInput);
  }

  Future getFilm(userInput) async {
    //Creating a new film object
    Film film = Film(userInput);
    //Using get film data method to store
    var filmData = await film.getFilmData();

    //Pushing the film data to the results page
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ResultsPage(filmData);
    }));
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
