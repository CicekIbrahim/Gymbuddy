class GetNum {
  int? status;
  String? gender;

  GetNum({this.status, this.gender});

  GetNum.fromJson(Map<String, dynamic> json) {
    status = json['number'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.status;
    data['gender'] = this.gender;
    return data;
  }
}