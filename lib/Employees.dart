class Employees {
  final int id;
  final String name;
  final String email;

  Employees({required this.id, required this.name, required this.email});

  // Convert the employees into a map. The keys must correspond to the name of the cloumns in the database
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'email': email};
  }

  // To see the information about each statement using the print statement
  @override
  String toString() {
    // TODO: implement toString
    return 'Employees{id: $id,name: $name, email: $email}';
  }
}
