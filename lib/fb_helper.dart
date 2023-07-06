import 'package:firebase_database/firebase_database.dart';


import 'order.dart';


class FirebaseHelper {

  // TODO As the number of methods interacting with Firebase will grow in the future of the project, we should think about a more maintainable architecture.

  static Stream<List<Order>> listenToOrders() async* {
    final db = await fbDb;
    yield* db
        .ref()
        .child('orders')
        .onValue
        .map((event) {
      final fbMap = event.snapshot.value as Map<String, dynamic>;
      return fbMap.values.map((e) =>
          Order(
            e['uuid'],
            e('employee_name'),
            e['order_title'],
            DateTime.fromMillisecondsSinceEpoch(e('order_start')),
            DateTime.fromMillisecondsSinceEpoch(e('order_end')),
          )).toList();
    });
  }

  static Future<void> writeOrder(Order order) async {
    final db = await fbDb;
    return db.ref().child('orders/${order.uuid}').set({
      'uuid': order.uuid,
      'employee_name': order.employeeName,
      'order_title': order.orderTitle,
      'order_start': order.orderStart.millisecondsSinceEpoch,
      'order_end': order.orderEnd.millisecondsSinceEpoch,
    });
  }

  static Future<FirebaseDatabase> get fbDb async {
    final db = FirebaseDatabase(
        databaseURL: "https://stage-25e0f.firebaseio.com");
    db.setPersistenceEnabled(true);
    return db;
  }
}