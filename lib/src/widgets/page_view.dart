import 'package:flutter_ui_chat/src/common_url_services.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> onboardList = [
      {
        "imageUrl":
            "https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-gra-130247647.jpg",
        "title": "Title 1",
        "subTitle": "SubTitle",
      },
      {
        "imageUrl":
            "https://thumbs.dreamstime.com/b/close-up-kids-hands-holding-seedlings-palm-forest-conservation-protection-development-ecosystem-nature-world-mental-225630760.jpg",
        "title": "Title 2",
        "subTitle": "SubTitle",
      },
      {
        "imageUrl":
            "https://media.istockphoto.com/id/658291850/photo/young-plant-growing-in-sunlight.jpg?s=170667a&w=0&k=20&c=3Pan5WU5xUzYXVPxEX91Oi2v8R_drZ9ncT7OVqk6pg4=",
        "title": "Title 3",
        "subTitle": "SubTitle",
      },
    ];
    PageController pageController = PageController();
    ValueNotifier<int> pageNotifier = ValueNotifier<int>(0);

    return Material(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: PageView.builder(
                itemCount: onboardList.length,
                onPageChanged: (int index) => pageNotifier.value = index,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> pageView = onboardList[index];
                  return Column(
                    children: [
                      Image.network(
                        pageView['imageUrl'],
                        height: MediaQuery.of(context).size.height / 1.8,
                        fit: BoxFit.contain,
                      ),
                    ],
                  );
                },
              ),
            ),
            ValueListenableBuilder(
              valueListenable: pageNotifier,
              builder: (context, currentIndex, child) => Row(
                children: [
                  ...List.generate(
                    onboardList.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor:
                            currentIndex == index ? Colors.teal : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
