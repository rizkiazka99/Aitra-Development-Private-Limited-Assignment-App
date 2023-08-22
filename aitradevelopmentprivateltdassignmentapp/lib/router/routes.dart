part of 'screens.dart';

abstract class _Paths {
  _Paths._();
  static const DASHBOARD = '/dashboard';
  static const KRISHIBAZAAR = '/krishi_bazaar_screen';
  static const DETAIL = '/detail_screen';
}

abstract class Routes {
  Routes._();
  static const DASHBOARD = _Paths.DASHBOARD;
  static const KRISHIBAZAAR = _Paths.KRISHIBAZAAR;
  static const DETAIL = _Paths.DETAIL;
}