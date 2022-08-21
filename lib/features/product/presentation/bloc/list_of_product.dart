class ListOfProduct<T> {
  final __ongoingAppointmenList = <T>[];

  List<T> get ongoingAppointmentlist {
    return [...__ongoingAppointmenList];
  }

  void add({required T appointments}) {
    if (__ongoingAppointmenList.isEmpty) {
      __ongoingAppointmenList.add(appointments);
    } else {
      // Need to add
      final isThere =
          __ongoingAppointmenList.any((appoin) => appoin == appointments);

      if (!isThere) {
        __ongoingAppointmenList.add(appointments);
      }
    }
  }

  void addAll({required List<T> appointments}) {
    __ongoingAppointmenList.addAll(appointments);
  }

  void removeAll() {
    __ongoingAppointmenList.removeWhere((_) => true);
  }
}
