import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Buton extends ConsumerStatefulWidget {
  const Buton(
      {required this.background,
      required this.title,
      required this.style,
      super.key});

  final Color background;
  final String title;
  final TextStyle style;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ButonState();
}

class _ButonState extends ConsumerState<Buton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          //   BoxShadow(
          //       color: c.disabled.withOpacity(0.4),
          //       blurRadius: 20.0,
          //       offset: const Offset(1, 1))
          // ],
          color: widget.background,
        ),
        height: size.height * 0.065,
        width: size.width * 0.85,
        child: Center(
          child: Text(
            widget.title,
            style: widget.style,
          ),
        ),
      ),
    );
  }
}


        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   duration: const Duration(seconds: 3),
        //   elevation: 0,
        //   dismissDirection: DismissDirection.startToEnd,
        //   backgroundColor: c.secondary,
        //   content: Text('Bienvenid@ de nuevo!', style: t.buttonBlue2),
        //   behavior: SnackBarBehavior.floating,
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        //   margin: EdgeInsets.only(
        //     bottom: size.height * 0.04,
        //     right: size.height * 0.025,
        //     left: size.height * 0.025,
        //   ),
        // ));