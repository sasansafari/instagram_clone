import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tec/gen/assets.gen.dart';

List<String> imgpostlist = [
  Assets.images.rectangle1.path,
  Assets.images.rectangle2.path,
  Assets.images.rectangle3.path,
  Assets.images.rectangle4.path,
  Assets.images.rectangle5.path,
  Assets.images.rectangle6.path,
  Assets.images.rectangle7.path,
  Assets.images.rectangle8.path,
  Assets.images.rectangle9.path,
  Assets.images.rectangle10.path,
  Assets.images.rectangle11.path,
  Assets.images.rectangle13.path,
  Assets.images.rectangle14.path,
  Assets.images.rectangle15.path,
  Assets.images.rectangle16.path,
  Assets.images.rectangle17.path,
  Assets.images.rectangle18.path,
  Assets.images.rectangle19.path,
  Assets.images.rectangle20.path,
  Assets.images.rectangle21.path,
];
List<Image> imageProfiles = [
  Image.asset(Assets.images.oval.path),
  Image.asset(Assets.images.kieronD.path),
  Image.asset(Assets.images.zackjohn.path),
  Image.asset(Assets.images.craigLove.path),
  Image.asset(Assets.images.martiniRound.path),
  Image.asset(Assets.images.maxjacobson.path),
  Image.asset(Assets.images.misPotter.path),
];
List<String> accountname = [
  'karennne',
  'kieron_d',
  'zackjohn',
  'craig_Love',
  'martini_round',
  'maxjacobson',
  'mis_potter'
];
Image imagePost = Assets.icons.imagePostMultiLike.image();
String liketime() {
  DateTime liketime = DateTime.now();

  return DateFormat('kk').format(liketime);
}
