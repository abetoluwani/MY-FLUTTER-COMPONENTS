import '../../gaas/lib/constants/images.dart';

class Onboard {
  final String image;
  final String title;
  final String description;
  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demodata = [
  Onboard(
    image: AppImages.page2,
    title: 'Welcome to Sport line',
    description: 'Watch professional league football matches',
  ),
  Onboard(
    image: AppImages.page1,
    title: 'League Standings',
    description: 'Club statistics and league standings around the world',
  ),
  Onboard(
    image: AppImages.page3,
    title: 'Realtime Statistics',
    description: 'Real-time football live scores and match statistics',
  ),
];
