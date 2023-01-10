import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/login/clipper2.dart';

import '../../utils/colors.dart';

class FormLogin extends ConsumerStatefulWidget {
  const FormLogin({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormLoginState();
}

class _FormLoginState extends ConsumerState<FormLogin> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: MyCustomClipper2(),
      child: Container(
        height: size.height,
        width: size.width,
        color: c.secondary,
      ),
    );
  }
}
