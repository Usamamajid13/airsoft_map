class MapValues {
  int? timeOfCircle;
  int? mapType;

  MapValues({this.timeOfCircle, this.mapType});

  MapValues.fromJson(Map<String, dynamic> json) {
    timeOfCircle = json['timeOfCircle'];
    mapType = json['mapType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timeOfCircle'] = this.timeOfCircle;
    data['mapType'] = this.mapType;
    return data;
  }
}
