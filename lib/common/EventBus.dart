import 'dart:ui';

import 'package:carbon_foot_print/models/items.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

EventBus eventBus = EventBus();

class SelectedItem {
  const SelectedItem(this.item);

  final Item item;
}

class SelectThemes {
  const SelectThemes(
    this.color,
  );

  final Color color;
}
