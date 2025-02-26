class TransectionEntity{
  String status;
  String  name;
  String id;
  String transectionType;
  List<String>? image;

  TransectionEntity(
      {required this.status,
        required this.name,
        required this.id,
        required this.transectionType,
        this.image,
      });
}