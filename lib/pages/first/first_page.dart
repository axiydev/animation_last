import 'package:animation_last/consts/consts.dart';
import 'package:animation_last/models/user_model.dart';
import 'package:animation_last/pages/second/second_page.dart';
import 'package:animation_last/widgets/additional_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

//animations package
class HomePage extends StatefulWidget {
  static const path = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> myList = List.empty(growable: true);

  @override
  void initState() {
    myList.addAll([
      for (var i = 0; i <= 50; i++)
        User(name: 'Sarvarjon $i', id: '$i', image: MyImages.wild)
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: AnimationLimiter(
          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: myList.length,
              itemBuilder: (context, index) =>
                  AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: myList.length,
                      duration: const Duration(milliseconds: 450),
                      child: SlideAnimation(
                        verticalOffset: 50,
                        child: FadeInAnimation(
                            child: Hero(
                                tag: myList[index].name,
                                child: _item(myList[index]))),
                      ))),
        ),
        floatingActionButton: OpenPageWithAnimation(
          pressWidget: Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue),
              alignment: Alignment.center,
              child: const RotatedBox(
                quarterTurns: 0,
                child: Icon(
                  Icons.home,
                  size: 35,
                ),
              )),
          openWidget: const SecondPage(
            text: 'first',
            image: '',
          ),
        ));
  }

  Widget _item(User user) {
    return OpenPageWithAnimation(
        openWidget: SecondPage(text: user.name, image: user.image),
        pressWidget: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset(user.image),
                Text(
                  user.name,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                )
              ],
            ),
          ),
        ));
  }
}
