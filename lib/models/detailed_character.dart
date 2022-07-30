class DetailedCharacter {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final CharacterLocation origin;
  final CharacterLocation location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  DetailedCharacter({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    this.episode = const [],
    required this.url,
    required this.created,
  });

  factory DetailedCharacter.fromJson(Map<String, dynamic> json) {
    return DetailedCharacter(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin: CharacterLocation.fromJson(json['origin']),
      location: CharacterLocation.fromJson(json['location']),
      image: json['image'],
      episode: List<String>.from(json['episode'].map((e) => e)),
      created: DateTime.parse(json['created']),
      url: '',
    );
  }
}

class CharacterLocation {
  CharacterLocation({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  factory CharacterLocation.fromJson(Map<String, dynamic> json) {
    return CharacterLocation(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}
