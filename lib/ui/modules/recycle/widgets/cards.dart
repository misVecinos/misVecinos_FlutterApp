import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class Cards extends ConsumerStatefulWidget {
  const Cards(
      {Key? key,
      required this.index,
      required this.size,
      required this.assets,
      required this.names})
      : super(key: key);

  final int index;
  final Size size;
  final List<String> assets;
  final List<String> names;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CardsState();
}

class _CardsState extends ConsumerState<Cards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.38,
      width: widget.size.width * 0.7,
      decoration: BoxDecoration(
        color: const Color(0xffFDFDFD),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: c.disabled.withOpacity(0.4),
              blurRadius: 20.0,
              offset: const Offset(1, 1))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            widget.assets[widget.index],
            height: widget.size.height * 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.names[widget.index],
                style: t.medium,
              ),
              Padding(
                padding: EdgeInsets.only(
                  // top: size.height * 0.35,
                  left: widget.size.height * 0.02,
                ),
                child: CircleAvatar(
                  radius: widget.size.height * 0.03,
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
    );
  }
}
