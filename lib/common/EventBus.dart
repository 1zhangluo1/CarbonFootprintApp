import 'package:carbon_foot_print/models/items.dart';
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class SelectedItem {
  const SelectedItem(
      this.item
  );

  final Item item;

}