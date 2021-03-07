class BaseImage {
  String id;
  String url;
  BaseImage(
    this.id,
    this.url,
  );
  BaseImage.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.url = jsonObject['url'];
  }
}
