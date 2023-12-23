import 'package:intl/intl.dart';

class Item {
  Item(
      {required this.name,
      required this.price,
      required this.amount,
      required this.description,
      this.id});

  // Dummy Data
  // static List<Item> list = [
  //   Item(
  //       name: "first item",
  //       price: 10000,
  //       amount: 10,
  //       description: "lorem lorem lorem lorem lorem"),
  //   Item(
  //       name: "second item",
  //       price: 20000,
  //       amount: 20,
  //       description: "lorem lorem lorem lorem lorem"),
  //   Item(
  //       name: "third item",
  //       price: 30000,
  //       amount: 30,
  //       description: "lorem lorem lorem lorem lorem"),
  // ];

  static List<Item> list = [];
  int? id;
  String name;
  int price;
  int amount;
  String description;
  String dateAdded = DateFormat('dd/MM/yyyy').format(DateTime.now());

  @override
  String toString() {
    String output = "";
    output += "$id. $name\n";
    output += "Harga: $price\n";
    output += "Jumlah: $amount\n";
    output += "Deskripsi: $description\n";
    output += dateAdded;
    return output;
  }
}