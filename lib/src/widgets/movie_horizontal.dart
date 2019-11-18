import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  const MovieHorizontal(
      {Key key, @required this.peliculas, @required this.siguientePagina})
      : super(key: key);
  final List<Pelicula> peliculas;
  final Function siguientePagina;
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    final _pageController =
        PageController(initialPage: 1, viewportFraction: 0.3);

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.3,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: peliculas.length,
        itemBuilder: (BuildContext context, int i) {
        return  _tarjeta(context,peliculas[i]);
        },
        pageSnapping: false,
      ),
    );
  }

  Widget _tarjeta(BuildContext context,Pelicula pelicula) {
    return Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(pelicula.getPosterImg()),
              placeholder: AssetImage('assets/loading.gif'),
              fit: BoxFit.cover,
              height: 160.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            pelicula.title,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  // List<Widget> _tarjetas(int i) {
  //   return peliculas.map((pelicula) {
  //     return Container(
  //       margin: EdgeInsets.only(right: 15.0),
  //       child: Column(
  //         children: <Widget>[
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(20.0),
  //             child: FadeInImage(
  //               image: NetworkImage(pelicula.getPosterImg()),
  //               placeholder: AssetImage('assets/loading.gif'),
  //               fit: BoxFit.cover,
  //               height: 160.0,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 10.0,
  //           ),
  //           Text(
  //             pelicula.title,
  //             overflow: TextOverflow.ellipsis,
  //           )
  //         ],
  //       ),
  //     );
  //   }).toList();
  // }
}
