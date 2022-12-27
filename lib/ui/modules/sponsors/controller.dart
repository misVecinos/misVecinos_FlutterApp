import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/modules/sponsors/sponsor.dart';

final sponsors = StateNotifierProvider<See, List<Sponsor>>((_) => See([
      Sponsor(
          id: 0,
          titulo: '¡Hagamos composta!',
          contenido: 'Hagamos composta y ayudemos al planeta. ¡Únete!',
          contenido2: 'Hagamos composta y ayudemos al planeta. ¡Únete!',
          imagen: 'assets/images/composta.jpg'),
      Sponsor(
          id: 1,
          titulo: '¡Pomposta para el planeta!',
          contenido: 'Pomposta más natural, más vida. ¡Únete!',
          contenido2: 'Pomposta más natural, más vida. ¡Únete!',
          imagen: 'assets/images/composta.jpg'),
      // Sponsor(
      //     id: 2,
      //     titulo: 'Secretaría del medio ambiente',
      //     contenido: 'Cuida al medio ambiente. Salva al planeta.',
      //     imagen: 'assets/images/semarnat.png'),
    ]));

class See extends StateNotifier<List<Sponsor>> {
  See(super.state);

  void removeAtIndex(int index) {
    List<Sponsor> list2 = [...state];
    list2.removeAt(index);
    state = list2;
  }
}
