import 'package:enseguida_shop/data/models/ropadb.dart';
import 'package:enseguida_shop/db/cart_db.dart';
import 'package:enseguida_shop/db/fav_db.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class CardIcons extends StatelessWidget {
  const CardIcons(
      {Key? key,
      required this.mid,
      required this.modelName,
      required this.modelPriceLow,
      required this.modelImage,
      required this.modelPrice,
      required this.modelColor})
      : super(key: key);
  final int mid;
  final String modelName;
  final double modelPriceLow;
  final String modelImage;
  final double modelPrice;
  final int modelColor;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 25,
      child: SizedBox(
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FavoriteWidget(mid, modelName, modelPriceLow, modelColor,
                modelImage, modelPrice),
            FavoriteWidget2(mid, modelName, modelPriceLow, modelColor,
                modelImage, modelPrice),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FavoriteWidget extends StatefulWidget {
  FavoriteWidget(
    this.id,
    this.modelName,
    this.modelPriceLow,
    this.modelColor,
    this.modelImage,
    this.modelPrice, {
    Key? key,
  }) : super(key: key);
  final int id;
  final String modelName;
  final double modelPriceLow;
  final String modelImage;
  final double modelPrice;
  final int modelColor;
  late var model = modelName;
  late var modelPriceL = modelPriceLow;
  late var modelI = modelImage;
  late var modelP = modelPrice;
  late var color2 = modelColor;
  @override
  _FavoriteWidgetState createState() =>
      // ignore: no_logic_in_create_state
      _FavoriteWidgetState(id, model, modelPriceL, modelI, modelP, color2);
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  // #enddocregion _FavoriteWidgetState-build
  bool _isFavorited = true;
  final int iD;
  final String model;
  final double modelPriceL;
  final String modelI;
  final double modelP;
  final int color2;
  _FavoriteWidgetState(this.iD, this.model, this.modelPriceL, this.modelI,
      this.modelP, this.color2);
  final FavoHelper _favHelper = FavoHelper();
  // #enddocregion _FavoriteWidgetState-fields
  void onSave() {
    var nombreM = model;
    var priceLow = modelPriceL;
    var image = modelI;
    var price = modelP;
    var RopaInfo = Ropaas(
      color: color2,
      model: nombreM,
      oldPrice: priceLow,
      currentPrice: price,
      images: image,
    );
    _favHelper.insertRopa(RopaInfo);
  }

  // #docregion _toggleFavorite
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        onSave();
      } else {
        _isFavorited = true;
      }
    });
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
                ? const Icon(FontAwesomeIcons.heart)
                : const Icon(FontAwesomeIcons.solidHeart)),
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
  FavoriteWidget2(
    this.id,
    this.modelName,
    this.modelPriceLow,
    this.modelColor,
    this.modelImage,
    this.modelPrice, {
    Key? key,
  }) : super(key: key);
  final int id;
  final String modelName;
  final double modelPriceLow;
  final String modelImage;
  final double modelPrice;
  final int modelColor;
  late var model = modelName;
  late var modelPriceL = modelPriceLow;
  late var modelI = modelImage;
  late var modelP = modelPrice;
  late var color2 = modelColor;
  @override
  _FavoriteWidgetState2 createState() =>
      // ignore: no_logic_in_create_state
      _FavoriteWidgetState2(id, model, modelPriceL, modelI, modelP, color2);
}

class _FavoriteWidgetState2 extends State<FavoriteWidget2> {
  // #enddocregion _FavoriteWidgetState-build
  bool _isFavorited2 = true;
  final int iD;
  final String model;
  final double modelPriceL;
  final String modelI;
  final double modelP;
  final int color2;
  _FavoriteWidgetState2(this.iD, this.model, this.modelPriceL, this.modelI,
      this.modelP, this.color2);
  final CartHelper _cartHelper = CartHelper();
  // #enddocregion _FavoriteWidgetState-fields

  // #docregion _toggleFavorite
  void _toggleFavorite2() {
    setState(() {
      if (_isFavorited2) {
        _isFavorited2 = false;
      } else {
        _isFavorited2 = true;
      }
    });
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
                ? const Icon(FontAwesomeIcons.shoppingCart)
                : const Icon(FontAwesomeIcons.shoppingBag)),
            iconSize: 35,
            color: Colors.green[400],
            onPressed: () {
              _toggleFavorite2;
              setState(() {
                if (_isFavorited2) {
                  _isFavorited2 = false;
                  launchWhatsApp(model, modelPriceL);
                  onSave2();
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

  void onSave2() {
    var nombreM = model;
    var priceLow = modelPriceL;
    var image = modelI;
    var price = modelP;
    var RopaInfo = Ropaas(
      color: color2,
      model: nombreM,
      oldPrice: priceLow,
      currentPrice: price,
      images: image,
    );
    _cartHelper.insertCompra(RopaInfo);
  }

  launchWhatsApp(String name, double pre) {
    var name2 = name;
    var precio = pre;
    var text = 'Deseo el modelo; ' + name2 + ' de precio: ' + precio.toString();
    // ignore: unnecessary_const
    var link = WhatsAppUnilink(
      phoneNumber: '+52-(733)3362625',
      text: text,
    );
    launch('$link');
  }
}
