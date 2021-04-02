import 'package:final_t_and_t/constatns.dart';
import 'package:flutter/material.dart';

class CategorySlider extends StatefulWidget {
  @override
  _CategorySliderState createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Subjects',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        width: width,
        height: 130.0,
        child: ListView.builder(
          itemCount: subjectList.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final item = subjectList[index];
            return InkWell(
              onTap: () {},
              child: Container(
                width: 130.0,
                margin: (index == subjectList.length - 1)
                    ? EdgeInsets.only(left: 10.0, right: 10.0)
                    : EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(item['image']), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(65)),
                child: Container(
                  width: 130.0,
                  height: 130.0,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(65.0),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: Text(
                    item['subject'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Signika Negative',
                      letterSpacing: 0.7,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }
}
