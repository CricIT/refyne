



import 'dart:io';



import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

class UserRepoApi implements APIRequestRepresentable {

  UserRepoApi._();

  UserRepoApi.fetch() : this._();

  @override
  get body => {};

  @override
  String get endpoint => APIEndpoint.userRepo;

  @override
  Map<String, String> get headers => {};

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  String get path {
    return "repositories?q=flutter";
  }

  @override
  get query => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
