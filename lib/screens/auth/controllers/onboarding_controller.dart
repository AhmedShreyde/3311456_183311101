import 'package:ecommerce_app/screens/auth/models/onboarding_info.dart';

class OnboardingController {
  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/order.png', 'Ürünlerinizi Sipariş Edin',
        'Artık cep telefonunuzdan istediğiniz zaman  sipariş edebilirsiniz'),
    OnboardingInfo('assets/images/cook.png', 'güvenli kargo',
        'We maintain safty and we keep clean while making food'),
    OnboardingInfo('assets/images/deliver.png', 'Quick Order Delivery',
        'Order your favorite meals will be imediately deliver'),
  ];
}