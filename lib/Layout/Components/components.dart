import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(
    article,
    context
    ) =>Padding(
padding: const EdgeInsets.all(10.0),
child: Row(
children: [
Container(
width: 120.0,
height: 120.0,
decoration: BoxDecoration(
image: DecorationImage(
image: NetworkImage(
'${article['urlToImage']}'
),
fit: BoxFit.cover,
)
),
),
SizedBox(
width: 20.0,
),
Expanded(
child: Container(
  height: 120.0,
  child:   Column(
  crossAxisAlignment: CrossAxisAlignment.start,

  mainAxisAlignment: MainAxisAlignment.start,


  children: [
  Text(

  '${article['title']}',

  style: Theme.of(context).textTheme.bodyText1,

  maxLines: 2,

  overflow: TextOverflow.ellipsis,

  ),
  Spacer(),
  Row(

  children: [

  Expanded(

  child: Text(

  '${article['source']['name']}',

  style: TextStyle(

  color: Colors.grey,

  ),
    maxLines: 1,

    overflow: TextOverflow.ellipsis,
  ),

  ),

  Expanded(

  child: Text(

  '${article['publishedAt']}',

  style: TextStyle(

  color: Colors.grey,

  ),

    maxLines: 1,
    overflow: TextOverflow.ellipsis,

  ),

  ),

  ],

  ),

  ],

  ),
),
),
],
),
);