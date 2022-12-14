import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class Kard extends StatelessWidget {
  const Kard(
      {Key? key, required this.title, required this.image, required this.fecha})
      : super(key: key);
  final String title;
  final String image;
  final String fecha;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.018),
      child: Container(
        height: size.height * .11,
        width: size.width * .8,
        color: c.surface,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: c.disabled.withOpacity(0.4),
                        blurRadius: 20.0,
                        offset: const Offset(1, 1))
                  ],
                  color: const Color(0xffFDFDFD),
                ),
                height: size.height * .14,
                width: size.width * .3,
                child: FittedBox(
                    fit: BoxFit.cover,
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(image)),
              ),
            ),
            //
            Container(
              color: c.surface,
              height: size.height * .135,
              width: size.width * .03,
            ),
            //
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size.width * .02),
                  child: Container(
                    color: c.surface,
                    //height: size.height * .055,
                    width: size.width * .4,
                    child: Text(title,
                        style: t.subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                //
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * .02, top: size.width * .015),
                  child: SizedBox(
                    width: size.width * .4,
                    child: Text(fecha,
                        style: t.terms,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                //
              ],
            ),
            const Spacer(),
            //
            Container(
              color: c.surface,
              child: SvgPicture.asset('assets/icons/svg/arrow-forward-ios.svg'),
            ),
          ],
        ),
      ),
    );
  }
}

class KardDocument extends StatelessWidget {
  const KardDocument({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.018),
      child: Container(
        height: size.height * .14,
        width: size.width * .9,
        color: c.surface,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: c.disabled.withOpacity(0.4),
                        blurRadius: 20.0,
                        offset: const Offset(1, 1))
                  ],
                  color: const Color(0xffFDFDFD),
                ),
                height: size.height * .14,
                width: size.width * .28,
                child: FittedBox(
                    fit: BoxFit.cover,
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(image)),
              ),
            ),
            //
            Container(
              color: c.surface,
              height: size.height * .135,
              width: size.width * .03,
            ),
            //
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size.width * .02),
                  child: Container(
                    color: c.surface,
                    //height: size.height * .055,
                    width: size.width * .5,
                    child: Text(title,
                        style: t.subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                //
                Padding(
                  padding: EdgeInsets.only(
                      left: size.width * .02, top: size.width * .015),
                  child: SizedBox(
                    width: size.width * .5,
                    child: Text('Documento PDF',
                        style: t.terms,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                //
              ],
            ),
            const Spacer(),
            //
            SizedBox(
              height: size.height * .06,
              width: size.width * .05,
              child: SvgPicture.asset('assets/icons/svg/arrow-forward-ios.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
