import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/home/home_desktop_view.dart';
import 'package:portfolio/utils/extensions.dart';
import 'package:scrollview_observer/scrollview_observer.dart';
import 'package:url_launcher/url_launcher.dart';

class LeftView extends StatelessWidget {
  const LeftView({
    Key? key,
    required this.observerController,
  }) : super(key: key);

  final ListObserverController observerController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "AJILESH V",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Mobile App Developer | Cybersecurity researcher",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Text(
                "I am a Flutter Developer with 1 years of intern experience in building cross-platform applications.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.5),
                ),
                maxLines: 2,
              ),
            ),
            SizedBox(height: 60),
            ValueListenableBuilder(
              valueListenable: currentSection,
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: ["About", "Experience", "Projects"]
                      .asMap()
                      .entries
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            currentSection.value = e.value;
                            observerController.animateTo(
                              index: e.key,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: SectionTile(
                            selected: e.value == value,
                            title: e.value,
                          ).pB(20),
                        ),
                      )
                      .toList(),
                );
              },
            ),
            SizedBox(height: 40),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () async {
                    final uri = Uri.parse("https://github.com/Aji46");
                    if (await canLaunchUrl(uri)) {
                      launchUrl(uri);
                    }
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                    color: Colors.white54,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final uri = Uri.parse("https://www.instagram.com/ajilesh_");
                    if (await canLaunchUrl(uri)) {
                      launchUrl(uri);
                    }
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.white54,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final uri = Uri.parse("https://www.linkedin.com/in/ajilesh-v-6a73821b1");
                    if (await canLaunchUrl(uri)) {
                      launchUrl(uri);
                    }
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.white54,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final uri = Uri.parse("https://drive.google.com/file/d/1WuHHmuEuuZvt30acW7QX88z2ZACifqIv/view?usp=drive_link"); // Replace with the actual URL to your CV file
                    if (await canLaunchUrl(uri)) {
                      launchUrl(uri);
                    }
                  },
                  icon: Text(
                    "Download CV",
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
