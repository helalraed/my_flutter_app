import 'package:get/get.dart';

class AppTranslations extends Translations {
  static const String noInternetConnection = 'no_internet_connection';
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'no_movies': 'no_movies'.tr,
      'loading': 'loading'.tr,
      'popular_movies': 'popular_movies'.tr,
      'details': 'details'.tr,
      'overview': 'overview'.tr,
      'rating': 'rating'.tr,
      'next': 'next'.tr,
      'get_started': 'Get Started',
      'log_start_your_driving': 'Log in to start your driving lessons.',
      'choose_you_role': 'Choose your role to access your driving dashboard.',
      'email': 'Email',
      'error': 'Error',
      'no_internet_connection': 'No Internet Connection',},
    'ar_JO': {
      'no_movies': 'لا يوجد أفلام',
      'loading': 'جاري التحميل...',
      'popular_movies': 'أفلام مشهورة',
      'details': 'تفاصيل',
      'overview': 'نبذة',
      'rating': 'التقييم',
      'next': 'التالي',
      'get_started': 'ابدأ',
      'log_start_your_driving': 'سجّل الدخول لبدء دروس القيادة.',
      'choose_you_role': 'اختر دورك للوصول إلى لوحة القيادة.',
      'email': 'البريد الإلكتروني',
      'error': 'خطأ',
      'no_internet_connection': 'لا يوجد اتصال بالإنترنت',}
  };
}
