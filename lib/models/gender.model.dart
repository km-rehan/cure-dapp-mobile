class Gender {
  final String name;
  final String value;

  Gender(this.name, this.value);

  Gender.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        value = json["value"];

  Map<String, dynamic> toJson() => {'name': name, 'value': value};
}
