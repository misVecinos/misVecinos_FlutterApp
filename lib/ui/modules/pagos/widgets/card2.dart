import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class LongCard extends StatelessWidget {
  const LongCard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.015),
      child: Align(
        child: Container(
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
          height: size.height * .1,
          width: size.width * .85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(title,
                  style: t.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              Image.asset('assets/icons/ok.png', height: size.height * 0.06)
            ],
          ),
        ),
      ),
    );
  }
}

class LongCard2 extends StatelessWidget {
  const LongCard2({Key? key, required this.title, required this.mesesAtraso})
      : super(key: key);
  final String title;
  final String mesesAtraso;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.015),
      child: Align(
        child: Container(
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
          height: size.height * .1,
          width: size.width * .85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: t.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  Text(mesesAtraso,
                      style: t.messages,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
              SvgPicture.asset('assets/icons/svg/time.svg',
                  color: c.disabled, height: size.height * 0.04)
            ],
          ),
        ),
      ),
    );
  }
}
