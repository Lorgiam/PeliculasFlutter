import 'package:flutter/material.dart';
import 'package:peliculas/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        centerTitle: false,
        title: Text('Peliculas en Cine'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      )),
      body: Container(
        child: Column(
          children: <Widget>[_swiperTarjetas()],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {
    final List<dynamic> list = [
      1,
      2,
      3,
      4,
      5,
    ];

    return CardSwiper(
      peliculas: list,
    );
  }
}
