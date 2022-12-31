import 'package:dio/dio.dart';
import 'package:dsc_flutter/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  test("Calculate Test", () {
    final users = [
      GenericUser("ALİ", "1", 10),
      GenericUser("aHMET", "2", 20),
      GenericUser("ayşe", "3", 30),
    ];
    final userManager=UserManager(adminUser("ADMİN","1",10,1));
     final result=userManager.calculateMoney(users);
     final response=userManager.ShowNames<String>(users);
     expect(result,70);
  });
}
