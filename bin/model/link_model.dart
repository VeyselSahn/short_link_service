class LinkModel {
  final String originalLink;
  final String shortLink;
  final String code;

  LinkModel({required this.code, required this.originalLink, required this.shortLink});
  factory LinkModel.fromJson(Map<String, dynamic> json) => LinkModel(
        originalLink: json["original_link"],
        shortLink: json["full_short_link"],
        code: json["code"],
      );
  Map<String, dynamic> toJson() => {"original_link": originalLink, "full_short_link": shortLink, "code": code};
}
