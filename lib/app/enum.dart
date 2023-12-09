enum NetworkUsedCase { loading, error, userNotFound, success }

enum UserPlatform { IOS, ANDROID, MWEB, DESKTOP, OTHER }

//Api call used case to handle custom messaging
extension NetworkState on NetworkUsedCase {
  int? get keyword {
    switch (this) {
      case NetworkUsedCase.loading:
        return 1;
      case NetworkUsedCase.error:
        return 2;
      case NetworkUsedCase.userNotFound:
        return 3;
      case NetworkUsedCase.success:
        return 4;

    }
  }
}

String GetMobilePlatform(val) {
  switch (val) {
    case UserPlatform.IOS:
      return "IOS";
    case UserPlatform.ANDROID:
      return "ANDROID";
    case UserPlatform.MWEB:
      return "MWEB";
    case UserPlatform.DESKTOP:
      return "DESKTOP";
    case UserPlatform.OTHER:
      return "OTHER";
    default:
      return "OTHER";
  }
}
