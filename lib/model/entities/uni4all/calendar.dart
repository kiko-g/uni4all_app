class Event {
  final String name;

  const Event({
    this.name,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json['name'],
    );
  }
}

class Calendar {
  final List<Event> events;

  const Calendar({
    this.events,
  });

  factory Calendar.fromJson(Map<String, dynamic> json) {
    return Calendar(
      events: json['events'],
    );
  }
}
