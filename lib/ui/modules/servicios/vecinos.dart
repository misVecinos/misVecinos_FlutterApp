import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/core/modules/vecinos/vecinos.dart';
import 'package:mis_vecinos_app/ui/modules/servicios/vecino_detail.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'controller.dart';
import 'widgets/services_item.dart';

class VecinosPage extends ConsumerStatefulWidget {
  const VecinosPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<VecinosPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Acordarse de watch, read y listen tienen distintas implicaciones
      final provider = ref.read(vecinoControllerProvider.notifier);
      provider.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final state = ref.watch(vecinoControllerProvider);
    List<NegocioVecino> listNegocios = state.negocios ?? [];

    return Column(
      children: [
        AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Servicios', style: t.title),
              Row(
                children: [
                  Text('A la redonda de', style: t.messages),
                  SizedBox(
                    width: size.height * 0.01,
                  ),
                  Text('La Joya, Toluca.', style: t.messagesBlue),
                ],
              ),
            ],
          ),
          actions: [
            Icon(
              Icons.abc,
              color: c.surface,
            ),
          ],
          backgroundColor: c.surface,
          elevation: 0,
          centerTitle: false,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                left: size.height * 0.025,
                top: size.height * 0.02,
                right: size.height * 0.025),
            children: [
              //
              //Text('Servicios que ofrecen tus vecinos:', style: t.messages),
              ListView.builder(
                  padding: const EdgeInsets.only(top: 0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listNegocios.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.018),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return VecinoDetail(
                              vecino: listNegocios[index],
                            );
                          }));
                        },
                        child: ServiceCards(vecino: listNegocios[index]),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
