import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class Cards extends StatelessWidget {
  const Cards({
    Key? key,
    required this.index,
    required this.size,
    required this.assets,
    required this.names,
  }) : super(key: key);

  final int index;
  final Size size;
  final List<String> assets;
  final List<String> names;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(size.height * 0.02),
        child: Container(
          height: size.height * 0.48,
          width: size.width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: c.disabled.withOpacity(0.4),
                  blurRadius: 20.0,
                  offset: const Offset(1, 1))
            ],
            color: const Color(0xffFDFDFD),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                assets[index],
                height: size.height * 0.35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    names[index],
                    style: t.medium,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      // top: size.height * 0.35,
                      left: size.height * 0.02,
                    ),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: c.primary,
                      child: Icon(
                        Icons.add,
                        color: c.secondary,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
