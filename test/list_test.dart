import 'package:dsc_flutter/303/generic_learn.dart';
import 'package:dsc_flutter/product/widget/cards/heigh_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test("Calculate Test", () {
    List<GenericUser> users = [
      GenericUser("ALİ", "1", 10),
      GenericUser("aHMET", "2", 20),
      GenericUser("ayşe", "3", 30),
    ];
    List<HeighCard> highCard=users.map((e) {
      return HeighCard(items: e.name.split('').toList());
    }).toList();

    try {
      users.singleWhere((element) =>element.findUserName("VB"));
    } catch (e) {
      print(e);
    }
  });
}