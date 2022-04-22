import 'package:flutter/material.dart';
import 'package:better_sit_floor/shared/constants.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DARK_GREY,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14)
                  .copyWith(bottom: 6),
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
            ),
            ...data.map((obj) => InfoCard(info: InfoCardData.fromJson(obj)))
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatefulWidget {
  const InfoCard({required this.info, Key? key}) : super(key: key);

  final InfoCardData info;

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      child: Column(
        children: [
          Image(image: AssetImage(widget.info.imgSrc), height: 120),
          const SizedBox(height: 10),
          Container(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.info.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              )),
          const SizedBox(height: 10),
          Container(
              alignment: Alignment.centerLeft,
              child: Text(widget.info.description)),
          expanded
              ? Container(
                  child: Text(widget.info.content),
                  padding: const EdgeInsets.only(top: 20),
                )
              : Container(),
          Container(
              padding: const EdgeInsets.all(20).copyWith(bottom: 0, top: 6),
              alignment: Alignment.center,
              child: GestureDetector(
                child: expanded
                    ? const Icon(Icons.keyboard_arrow_up_outlined)
                    : const Icon(Icons.keyboard_arrow_down_outlined),
                onTap: () => setState(() {
                  expanded = !expanded;
                }),
              )),
        ],
      ),
    );
  }
}

class InfoCardData {
  String imgSrc;
  String description;
  String content;
  String title;
  InfoCardData(
      {required this.content,
      required this.description,
      required this.imgSrc,
      required this.title});

  factory InfoCardData.fromJson(Map json) {
    return InfoCardData(
      imgSrc: json['imgSrc'],
      description: json['description'],
      content: json['content'],
      title: json['title'],
    );
  }
}

List data = [
  {
    "content": """Corn is basically in all the food we eat.
- It’s become so prevalent in the food supply that it’s almost impossible to avoid.
Well for resting our bodies we have a similar situation happening.
Sitting in a chair puts your body in a single very distinct position.
\n\nAlong with the toilet, the car, the couch, the bike, the exercise equipment
- we are constantly being asked to put our bodies in this one shape for extended periods of time. 
\n\nThis shape becomes the dominant resting nutrient. 
Where the problem starts is that the other resting nutrients, 
the ones that open your hips as well as strengthens your legs & back, 
are no longer part of your resting diet.
\n\nOur bodies are a part of nature. We do better when challenged with variety and little bits of stress. 
Not so much stress that it hurts you but just enough to continue to be challenged and grow stronger.""",
    "title": "Why you should sit on the floor",
    "description": "The monocrop of human resting",
    "imgSrc": "assets/blog/chair-sitting-guy.png"
  },
  {
    "content": """Encourages natural stability. 
Without the support of a chair, floor sitting forces you to engage your core for stabilization.
\n\nLess hip tension. 
Prolonged chair sitting can make your hips tight and stiff. 
\n\nBut when you sit on the floor, you can easily stretch your hip flexors.
\n\nIncreased flexibility. Seated positions allow you to stretch your lower body muscles.
\n\nIncreased mobility. As you actively stretch certain muscles, your mobility will improve.
\n\nMore muscle activity. Some postures, like kneeling and squatting, are “active rest” positions. 
\n\nThey require more muscle activity than sitting in a chair.
""",
    "title": "Benefits of sitting on the floor",
    "description": "The potential advantages of sitting on the floor include:",
    "imgSrc": "assets/blog/all_positions.jpeg"
  },
  {
    "content":
        """Extra stress on your joints. In some positions, the weight of your upper body is placed on your lower limbs. 
This can put pressure on your knees and ankles.\n\nReduced blood circulation. 
The load of your upper body may also decrease circulation in your lower limbs.
\n\nPoor posture. It’s important to avoid slouching. Otherwise, you may develop or worsen postural issues and back pain.
\n\nExacerbating existing joint problems. Sitting on the floor may not be ideal if you have existing issues in your hips, knees, or ankles.
\n\nProblems standing back up. Similarly, joint issues could make it difficult to get off the floor.""",
    "title": "Things to consider when sitting on the floor",
    "description":
        "Although sitting on the floor may have benefits, doing it incorrectly could cause problems. Potential side effects include:",
    "imgSrc": "assets/blog/random.png"
  },
  {
    "content":
        """Anecdotal and clinical evidence shows that different ways of sitting place different physical stresses on our bodies. 
Sitting for a long time in the same position normally affects the structure of your low back, called the lumbar region of the spine and the movement characteristics of your pelvis. 
And it’s believed this might lead to health problems in the long run, such as arthritis.\n\nThis is why people are normally advised to make use of appropriate supports or assistive devices and to switch positions often when sitting for a long time.
\n\nResearchers and doctors have looked at the ergonomics of sitting on chairs and have provided a variety of tips on sitting upright and how to avoid long-term health problems. But there is actually little scientific evidence on sitting on the floor.
\n\nDespite this, health professionals are increasingly advising that sitting on the floor helps to maintain the natural curvature of the spine and so helps people sit more upright and improve posture. 
It’s also claimed that sitting on the floor helps to improve strength and flexibility and can help you avoid lower-back pain.\n\nThough there is limited research on floor sitting, there may be some truth to these claims. 
This is because the spinal structure shows an inward natural spine curvature at the lower back called lumbar lordosis. When sitting on the floor, the lumbar lordosis is relatively low, which is closer to our natural position and posture.
\n\nSitting cross-legged could also bring about the natural and correct curvature both at the upper and lower back, effectively stabilising the lower back and pelvis region. But that said, 
certain sitting postures rotate the pelvis backwards and the lumbar lordosis is more flattened than it is when sitting on a chair, which can cause problems.""",
    "title": "Sitting on a chair vs sitting on the floor",
    "description":
        "Should we be opting for the floor over a chair in the interest of our health and wellbeing?",
    "imgSrc": "assets/blog/chair-sitting.png"
  },
];
