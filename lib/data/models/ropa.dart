class Ropa {
  final int id;
  final String model;
  final double oldPrice;
  final double currentPrice;
  final String images;
  final int color;
  bool favorite;

  Ropa(
      {required this.id,
      required this.model,
      required this.oldPrice,
      required this.currentPrice,
      required this.images,
      required this.color,
      required this.favorite});
}

final bodegaRopa = <Ropa>[
  Ropa(
      id: 0,
      model: 'BLAZER ROJO',
      oldPrice: 400,
      currentPrice: 300,
      images: 'assets/images/blazer rojo.png',
      color: 0xFFe8c149,
      favorite: false),
  Ropa(
      id: 1,
      model: 'BLAZER NEGRO',
      oldPrice: 400,
      currentPrice: 299,
      images: 'assets/images/blazer negro.png',
      color: 0xFFe8c149,
      favorite: false),
  Ropa(
      id: 2,
      model: 'CONJUNTO ROJO Y NEGRO',
      oldPrice: 399,
      currentPrice: 350,
      images: 'assets/images/coordinado rojo y negro.png',
      color: 0xFFe8c149,
      favorite: false),
  Ropa(
      id: 3,
      model: 'CONJUNTO BLANCO Y AZUL',
      oldPrice: 399,
      currentPrice: 350,
      images: 'assets/images/coordinado blanco y azul.png',
      color: 0xFFe8c149,
      favorite: false),
  Ropa(
      id: 4,
      model: 'SET DE PANTS ROJO',
      oldPrice: 410,
      currentPrice: 300,
      images: 'assets/images/set pants rojo.png',
      color: 0xFFe8c149,
      favorite: false),
  Ropa(
      id: 5,
      model: 'SET DE PANTS VERDE',
      oldPrice: 410,
      currentPrice: 300,
      images: 'assets/images/set pants verde.png',
      color: 0xFFe8c149,
      favorite: false),
  Ropa(
      id: 6,
      model: 'VESTIDO NEGRO',
      oldPrice: 400,
      currentPrice: 320,
      images: 'assets/images/vestido negro.png',
      color: 0xFFe8c149,
      favorite: false),
  Ropa(
      id: 7,
      model: 'VESTIDO ROJO',
      oldPrice: 400,
      currentPrice: 320,
      images: 'assets/images/vestido rojo.png',
      color: 0xFFe8c149,
      favorite: false),
];
