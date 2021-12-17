import 'package:enseguida_shop/db/cart_db.dart';
import 'package:enseguida_shop/presentation/pages/my_home/my_home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Iconos2 extends StatelessWidget {
  const Iconos2(
      {Key? key,
      required this.modelName,
      required this.modelPriceLow,
      required this.id})
      : super(key: key);
  final String modelName;
  final String modelPriceLow;
  final int id;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 25,
      child: SizedBox(
        width: 320,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FavoriteWidget(id, modelName, modelPriceLow),
            FavoriteWidget2(id, modelName, modelPriceLow)
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FavoriteWidget extends StatefulWidget {
  final String modelName;
  final int id;
  final String modelPrecio;
  FavoriteWidget(this.id, this.modelName, this.modelPrecio, {Key? key})
      : super(key: key);
  late var idd = id;
  late var namee = modelName;
  late var precioo = modelPrecio;
  @override
  _FavoriteWidgetState createState() =>
      // ignore: no_logic_in_create_state
      _FavoriteWidgetState(idd, namee, precioo);
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  // #enddocregion _FavoriteWidgetState-build
  final int iD;
  final String precio;
  final String name;
  bool _isFavorited = true;
  _FavoriteWidgetState(this.iD, this.name, this.precio);
  // #enddocregion _FavoriteWidgetState-fields

  // #docregion _toggleFavorite
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
        launchWhatsApp(name, precio);
      }
    });
  }

  launchWhatsApp(String yih, String yih2) {
    var name2 = yih;
    var tex2 = yih2;
    var text = 'Deseo el modelo; ' + name2 + ' de precio: ' + tex2;
    // ignore: unnecessary_const
    var link = WhatsAppUnilink(
      phoneNumber: '+52-(733)3362625',
      text: text,
    );
    launch('$link');
  }

  // #enddocregion _toggleFavorite

  // #docregion _FavoriteWidgetState-build
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(FontAwesomeIcons.envelope)
                : const Icon(FontAwesomeIcons.envelopeOpenText)),
            iconSize: 35,
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class FavoriteWidget2 extends StatefulWidget {
  final String modelName;
  final int id;
  final String modelPrecio;
  FavoriteWidget2(
    this.id,
    this.modelName,
    this.modelPrecio, {
    Key? key,
  }) : super(key: key);
  late var name = modelName;
  late var precio = modelPrecio;
  late var idd = id;
  @override
  _FavoriteWidgetState2 createState() =>
      // ignore: no_logic_in_create_state
      _FavoriteWidgetState2(name, precio, idd);
}

class _FavoriteWidgetState2 extends State<FavoriteWidget2> {
  // #enddocregion _FavoriteWidgetState-build
  bool _isFavorited2 = true;
  String name;
  String image;
  final int iD;
  _FavoriteWidgetState2(this.name, this.image, this.iD);
  late var getname = name;
  late var getimagen = image;
  final CartHelper _cartHelper = CartHelper();
  // #enddocregion _FavoriteWidgetState-fields

  // #docregion _toggleFavorite
  void _toggleFavorite2() {
    setState(() {
      _isFavorited2 = !_isFavorited2;
    });
  }

  void deleteComprar() {
    var id = iD;
    _cartHelper.delete(id);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyHome()));
  }

  // #enddocregion _toggleFavorite

  // #docregion _FavoriteWidgetState-build
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited2
                ? const Icon(FontAwesomeIcons.trash)
                : const Icon(FontAwesomeIcons.minus)),
            iconSize: 35,
            color: Colors.green[400],
            onPressed: () {
              _toggleFavorite2;
              setState(() {
                if (_isFavorited2) {
                  _isFavorited2 = false;
                  deleteComprar();
                } else {
                  _isFavorited2 = true;
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
