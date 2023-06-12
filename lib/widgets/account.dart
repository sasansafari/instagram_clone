import 'package:tec/gen/assets.gen.dart';

class Account {
  String nameaccount;
  String imgaccount;
  Account({required this.imgaccount, required this.nameaccount});
}

List<Account> accountlist = [
  Account(imgaccount: Assets.images.oval.path, nameaccount: 'karennne')
];
List<String> imgpostlist = [
  Assets.images.rectangle1.path,
  Assets.images.rectangle2.path,
  Assets.images.rectangle3.path,
];
