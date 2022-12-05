import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class TermsScreen extends ConsumerWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Aviso de Privacidad',
          style: t.medium,
        ),
        backgroundColor: c.secondary,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: size.height * 0.025,
          right: size.height * 0.025,
        ),
        children: [
          const Text(
              textAlign: TextAlign.justify,
              'La Ley Federal de Protección de Datos Personales en Posesión de los Particulares, publicada en el Diario Oficialde la Federación el día 5 de julio de 2010, tiene por objeto la protección de los datos personales en posesión de losparticulares con la finalidad de regular su tratamiento legítimo, controlado e informado, a efecto de garantizar la privacidad y el derecho a la autodeterminación informativa de las personas. En este contexto y mediante este documento, se informa a ustedsobre los datos personales que le son recabados y las finalidades y características relevantes de su tratamiento.'),
          const Divider(),
          Text(
              textAlign: TextAlign.justify,
              'RESPONSABLE DEL TRATAMIENTO DE SUS DATOS PERSONALES',
              style: t.messagesBold),
          const Text(
              textAlign: TextAlign.justify,
              'Alter Brain Solutions, S.A. de C.V. ,con domicilio en Independencia Norte Número 101 Planta Alta-A, Colonia Centro, C.P. 52300, Tenango del Valle, Estado de México, México, es responsable del tratamiento de sus datos personales. La información de nuestros clientes, clientes potenciales y antiguos clientes es tratada de forma estrictamente confidencial y es tan importante como su seguridad al adquirir algún bien y/o servicio, por lo que hacemos un esfuerzo permanente para salvaguardarla. DATOS QUE SE RECABAN Los datos personales que tratará Alter Brain Solutions, S.A. de C.V. son: nombre o razón social, domicilio, Cuenta Unica de Registro de Población, Registro Federal de Contribuyentes, edad, correo electrónico, teléfono (fijo y/o celular), si es usuario de redes sociales, género, gustos y preferencias; así como también, de resultar aplicable, al centro escolar, lugares de trabajo y cargo laborales.'),
          const Divider(),
          Text('FINALIDADES DEL TRATAMIENTO DE LOS DATOS PERSONALES',
              style: t.messagesBold),
          const Text(
              textAlign: TextAlign.justify,
              'Más que una política, en Alter Brain Solutions, S.A. de C.V. tenemos la filosofia de mantener una relación estrecha y activa con nuestros clientes, clientes potenciales y antiguos cliente. En este sentido, Alter Brain Solutions, S.A. de C.V. tratará sus datos personales para las siguientes finalidades: 1. Para el caso de clientes: a Finalidades necesarias para el mantenimiento de la relación con el Cliente: • Proveerle un bien o servicio; Mantener actualizados nuestros registros para poder responder a sus consultas; • Hacer válida la garantía en la adquisición de bienes o servicios • Informarle acerca de llamados a revisión del uso de sus bienes o servicios adquiridos. b) Finalidades distintas: • Realizar actividades de mercadeo y promoción; • Ofrecerle nuestros productos, servicios e información de nuestros socios de negocios; • Análisis estadísticos y de mercado; • Invitarlo a eventos; •Hacer de su conocimiento nuestras promociones y lanzamientos. En caso de que nuestros clientes no deseen que Alter Brain Solutions, S.A. de C.V. de tratamiento a sus datos personales para las finalidades previstas en el inciso b) anterior, tendrán un plazo de 5 (cinco) días para manifestar su negativa mediante escrito debidamente firmado, enviado al Comité de Protección de Datos Personales de Alter Brain Solutions, S.A. de C.V. y/u Oficina de Asuntos Legales vía correo electrónico a la siguiente dirección: info@alterbrain.com.mx, o bien, presentado en días hábiles en horario de 10:00 a 17:00 hrs. en el domicilio de Alter Brain Solutions, S.A. de C.V. senalado al inicio de este Aviso de Privacidad. II. Para el caso de clientes potenciales y antiguos clientes • Realizar actividades de mercadeo y promoción; • Ofrecerle nuestros productos, servicios e información de nuestros socios de negocios; • Análisis estadísticos y de mercado; • Mantener actualizados nuestros registros para poder responder a sus consultas; • Invitarle a eventos; • Hacer de su conocimiento nuestras promociones y lanzamientos. '),
          const Divider(),
          Text(
              textAlign: TextAlign.justify,
              'MEDIDAS PARA PROTEGER LOS DATOS PERSONALES ',
              style: t.messagesBold),
          const Text(
              textAlign: TextAlign.justify,
              'Para prevenir el acceso no autorizado de sus datos personales y con el fin de asegurar que la información sea utilizada para los fines establecidos en este Aviso de Privacidad, Alter Brain Solutions, S.A. de C.V. ha establecido procedimientos físicos, electrónicos y administrativos, utilizando tecnologias avanzadas que limitan el uso o divulgación de sus datos, lo que permite que éstos sean tratados de forma adecuada. Estos procedimientos son evaluados y revisados constantemente por el Area de Control Interno de Alter Brain Solutions, S.A. de C.V., a fin de controlar el uso y divulgación de sus datos personales. '),
          const Divider(),
          Text(
              textAlign: TextAlign.justify,
              'TRANSFERENCIA DE DATOS PERSONALES',
              style: t.messagesBold),
          const Text(
              textAlign: TextAlign.justify,
              ' Con el fin de proveerle un bien y/o servicio, así como hacer válida la garantía correspondiente, realizar actividades de promoción, realizar análisis estadísticos y de mercadeo, así como para hacerle llegar información de nuestros socios de negocios, Alter Brain Solutions, S.A. de C.V. podrá transferir sus datos personales tanto dentro como fuera de los Estados Unidos Mexicanos a sociedades subsidiarias, afiliadas o relacionadas con Alter Brain Solutions, S.A. de C.V., sus Distribuidores Autorizados y/o sus terceros proveedores de servicios con quienes tiene una relación jurídica, asi como a autoridades competentes. No será necesario el consentimiento de los clientes, clientes potenciales o antiguos clientes de Alter Brain Solutions, S.A. de C.V. cuando las transferencias se realicen a sociedades del mismo grupo de Alter Brain Solutions, S.A. de C.V. toda vez que operan bajo los mismos procesos y políticas internas; o bien cuando dicha transferencia sea necesaria para ofrecerle un bien o servicio, mantener actualizados nuestros registros, para responder a sus consultas, hacer válida la garantía de su bien y/o servicio, hacerle llamados para revisión de su bien o servicio derivado de la relación comercial. Respecto a la transferencia de los datos personales de clientes potenciales a terceros prestadores de servicios, le informamos que si Usted no manifiesta su negativa, mediante el envio de solicitud firmada por el Titular, dirigida al correo electrónico: info@alterbrain.com.mx, o bien presentada en días hábiles en horario de 10:00 a 17:00 hrs; en el domicilio de Alter Brain Solutions, S.A de C.V. señalado al inicio de este Aviso de Privacidad, en un plazo de cinco días naturales contados a partir de la puesta a disposición del presente Aviso de Privacidad, entenderemos que nos ha otorgado su consentimiento para dicha transferencia. '),
          const Divider(),
          Text(
              style: t.messagesBold,
              textAlign: TextAlign.justify,
              'SOLICITUD DE ACCESO, RECTIFICACIÓN, CANCELACIÓN U OPOSICIÓN DE DATOS PERSONALES Y REVOCACIÓN DEL CONSENTIMIENTO (SOLICITUD ARCO) '),
          const Text(
              textAlign: TextAlign.justify,
              'Todos sus datos personales son tratados de acuerdo a la legislación aplicable y vigente en el pais (Estados Unidos Mexicanos), por ello le informamos que usted tiene en todo momento el derecho de acceder a los datos personales que posee Alter Brain Solutions, S.A. de C.V. y a los detalles del tratamiento de los mismos, así como de rectificarlos en caso de ser inexactos o incompletos; cancelarlos cuando resulten ser excesivos o innecesarios para las finalidades que justificaron su obtención; y oponerse a su tratamiento para los fines previstos en este Aviso de Privacidad, a través del Comité de Protección de Datos Personales de Alter Brain Solutions, S.A. de C. V. y/u Oficina de Asuntos Legales, mediante el envío de solicitud firmada por el Titular, dirigida al correo electrónico: info@alterbrain.com.mx; o bien presentada en días hábiles en horario de 10:00 a 17:00 hrs; en el domicilio de Alter Brain Solutions, S.A. de C.V. señalado al inicio de este Aviso de Privacidad que contenga cuando menos la siguiente información: • Nombre completo del titular de los datos. • Domicilio del titular de los datos y/o dirección de correo electrónico para comunicar respuesta a solicitud. • Documentos oficiales que acrediten identidad y/ o autorización para representarlo en la solicitud (Credencial de Elector vigente otorgada por el Instituto Nacional Electoral "INE" o Pasaporte vigente). • Descripción de los datos personales sobre los que se pretende ejercer algún derecho ARCO. • Cualquier otro elemento que permita la localización de los datos personales y la atención a su solicitud. A través de estos canales, en su solicitud usted podrá especificar el medio por el cual desea recibir respuesta a la misma, ya que en caso de no contar con esta especificación de su parte, Alter Brain Solutions, S.A. de C. V. establecerá el canal que considere pertinente para hacerle llegar la contestación a su requerimiento '),
          const Divider(),
          Text(
              textAlign: TextAlign.justify,
              'MECANISMOS Y PROCEDIMIENTOS PARA LA  REVOCACIÓN DE CONSENTIMIENTO',
              style: t.messagesBold),
          const Text(
              textAlign: TextAlign.justify,
              'En cualquier momento, los clientes o clientes potenciales podrán solicitar la revocación del consentimiento que han otorgado para el tratamiento de sus datos personales, comunicando dicha solicitud al  Comité de Protección de Datos Personales de Alter Brain  Solutions, S.A. de C.V. y/u Oficina de Asuntos Legales mediante el envío de solicitud firmada por el Titular, dirigida al correo electrónico info@alterbrain.com.mx, o bien, presentada en días hábiles en horario de 10:00 a  17:00 hrs. en el domicilio de Alter Brain Solutions, S.A. de C.V. señalado al inicio de este Aviso de Privacidad.  En cualquier caso, dicha solicitud deberá detallar claramente los datos respecto de los cuales se revoca su  consentimiento '),
          const Divider(),
          Text(
              textAlign: TextAlign.justify,
              'OPCIONES Y MEDIOS PARA LIMITAR EL USO O DIVULGACIÓN DE SUS DATOS PERSONALES ',
              style: t.messagesBold),
          const Text(
              textAlign: TextAlign.justify,
              'Nuestros clientes, clientes potenciales y antiguos clientes tienen la posibilidad de limitar el uso o divulgación de sus datos personales o negarse a la transferencia de los mismos, a través del Comité de Protección de Datos Personales de Alter Brain Solutions. S.A. de C.V. y/u Oficina de Asuntos Legales, mediante el envío de solicitud firmada por el Titular, dirigida al correo electrónico: info@alterbrain.com.mx o bien, presentada en días hábiles en horario de 10:00 a 17:00 hrs. en el domicilio de Alter Brain Solutions, S.A. de C.V. señalado al inicio de este Aviso de Privacidad, precisando fehacientemente la limitación deseada al uso de sus datos personales Si usted desea dejar de recibir mensajes promocionales, puede solicitarlo a través del Comité de Protección de Datos Personales de Alter Brain Solutions, S.A. de C.V. v/u Oficina de Asuntos Legales, mediante el envio de solicitud firmada por el Titular, dirigida al correo electrónico: info@alterbrain.com.mx, o bien, presentada en días hábiles en horario de 10:00 a 17:00 hrs. en el domicilio de Alter Brain Solutions, S.A. de C.V. señalado al inicio de este Aviso de Privacidad. '),
          const Divider(),
          Text(
              textAlign: TextAlign.justify,
              'MECANISMOS PARA RECABAR DATOS PERSONALES DE MANERA AUTOMÁTICA EN MEDIOS REMOTOS O LOCALES DE COMUNICACION ELECTRÓNICA ',
              style: t.messagesBold),
          const Text(
              textAlign: TextAlign.justify,
              'La página de internet de Alter Brain Solutions, S.A. de CV. (http://www.alterbrain.com.mx/),aligualqueotros sitios y micro sitios propiedad de Alter Brain Solutions, S.A. de C.V., utilizan "cookies" para su funcionamiento, lo que a su vez nos permite obtener datos personales del Titular que nos contacta por dicho medio. Los clientes. clientes potenciales y antigos clientes que naveguen por nuestros sitios de internet pueden optar por desactivar la funcionalidad de las "cookies" dentro de su buscador, tomando e consideración que posiblemente no podrá visualizar todo el contenido de dichas páginas de internet. Para obtener más información acerca de la forma en que se pueden desactivar las "cookies" por favor dirijase a la Política de Privacidad de Alter Brain Solutions, S.A. de C.V. '),
          const Divider(),
          Text(
              textAlign: TextAlign.justify,
              'MODIFICACIONES AL AVISO DE PRIVACIDAD ',
              style: t.messagesBold),
          const Text(
              textAlign: TextAlign.justify,
              'Este Aviso de Privacidad podrá ser modificado de tempo en tempo por Alter Brain Solutions, S.A. de C.V.; Dichas modificaciones e serán oportunamente informadas a través de su página en internet http://www.alterbrain .com.mx/, o cualquier otro medio de comunicación oral, impreso, electrónico o mediante el uso de cualquier otra tecnología, que Alter Brain Solutions, S.A. de C.V. determine para tal efecto.'),
          const Divider(),
          const Text(
              textAlign: TextAlign.justify,
              'Fecha de última actualización: 31 de enero de 2020.')
        ],
      ),
    );
  }
}
