import 'package:flutter/material.dart';

class Review extends StatelessWidget { 

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Reviews'),
      backgroundColor: Colors.green,
    ),
    body: Column(
      children: [
      Image.asset(
        'images/target.PNG',
        width: 600,
        height: 240,
        fit: BoxFit.cover,
      ),
        titleSection,
        buttonSection,
        textSection
      ],
      )
     );
}

}


Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Target',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Fort-Worth, Texas',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.black,
      ),
      Text('2/10'),
    ],
  ),
);

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Came to this target location and went through the check out isle.'
      'After I had all of my item rung up, as I tried to pay the system crashed.'
      '  Then I had to sit there for several minutes while to wait on the manager'
      ' to come and handle the situation, whose next action was to go and figure out '
      'if I was charged, which took a while, only for her to come back and confirm that '
      'I hadn’t been charged so I had to unbag all of my items for them to check me out again. '
   
  ),
);



  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }





Widget buttonSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(Colors.black, Icons.masks, 'YES'),
      _buildButtonColumn(Colors.black, Icons.sanitizer, 'YES'),
      _buildButtonColumn(Colors.black, Icons.arrow_forward, 'NO'),
    ],
  ),
);