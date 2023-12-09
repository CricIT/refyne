

class GeneralResponse {
  String? status;
  String? message;
  List<Errors>? errors;
  String? documentationUrl;

  GeneralResponse(
      {this.status, this.message, this.errors, this.documentationUrl});

  GeneralResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(new Errors.fromJson(v));
      });
    }
    documentationUrl = json['documentation_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v.toJson()).toList();
    }
    data['documentation_url'] = this.documentationUrl;
    return data;
  }
}

class Errors {
  String? resource;
  String? field;
  String? code;

  Errors({this.resource, this.field, this.code});

  Errors.fromJson(Map<String, dynamic> json) {
    resource = json['resource'];
    field = json['field'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resource'] = this.resource;
    data['field'] = this.field;
    data['code'] = this.code;
    return data;
  }
}
