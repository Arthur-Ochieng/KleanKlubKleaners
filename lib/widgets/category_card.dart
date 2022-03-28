import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  //const CategoryCard({Key? key}) : super(key: key);

  final _title;
  final _courseAmount;
  final _imageUrl;

  CategoryCard(this._title, this._courseAmount, this._imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 30,
        height: MediaQuery.of(context).size.width / 2,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              _imageUrl,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$_courseAmount Courses',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff8F95B2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
