import 'package:flutter/material.dart';
import 'package:netflix_ui_app/models/models.dart';

class SeriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Top Series',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontFamily: 'Oswald',
              ),
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      InkWell(onTap: () {}, child: getTopSeries(index: index)),
                  itemCount: series.length,
                )),
          ],
        ),
      ),
    );
  }
}
