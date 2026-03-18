import '../../exceptions/domain_exception.dart';

class LocalResponse<T> {
  LocalResponse({this.data, this.error});

  T? data;
  DomainException? error;

  bool get hasData => data != null;
  bool get hasError => error != null;
}
