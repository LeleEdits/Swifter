import 'package:flutter/material.dart';

const users = [
  userGordon,
  userSalvatore,
  userSacha,
  userDeven,
  userSahil,
  userReuben,
  userNash,
];

const userGordon = DemoUser(
  id: 'gordon',
  name: 'Gordon Hayes',
  image:
  'https://pbs.twimg.com/profile_images/1262058845192335360/Ys_-zu6W_400x400.jpg',
);

const userSalvatore = DemoUser(
  id: 'salvatore',
  name: 'Salvatore Giordano',
  image:
  'https://pbs.twimg.com/profile_images/1252869649349238787/cKVPSIyG_400x400.jpg',
);

const userSacha = DemoUser(
  id: 'sacha',
  name: 'Sacha Arbonel',
  image:
  'https://pbs.twimg.com/profile_images/1199684106193375232/IxA9XLuN_400x400.jpg',
);

const userDeven = DemoUser(
  id: 'deven',
  name: 'Deven Joshi',
  image:
  'https://pbs.twimg.com/profile_images/1485713364005568517/_VwtLFrL_400x400.jpg',
);

const userSahil = DemoUser(
  id: 'sahil',
  name: 'Sahil Kumar',
  image:
  'https://pbs.twimg.com/profile_images/1181951104411504641/Yhv6JJJz_400x400.jpg',
);

const userReuben = DemoUser(
  id: 'reuben',
  name: 'Reuben Turner',
  image:
  'https://pbs.twimg.com/profile_images/1370571324578480130/UxBBI30i_400x400.jpg',
);

const userNash = DemoUser(
  id: 'nash',
  name: 'Nash Ramdial',
  image:
  'https://pbs.twimg.com/profile_images/1230262214193483783/DF_QIKmR_400x400.jpg',
);

@immutable
class DemoUser {
  final String id;
  final String name;
  final String image;

  const DemoUser({
    required this.id,
    required this.name,
    required this.image,
  });
}