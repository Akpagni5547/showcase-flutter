import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  GlobalKey _one = GlobalKey();
  BuildContext? myContext;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ShowCaseWidget.of(myContext!)!.startShowCase([_one,]);
      Future.delayed( const Duration(milliseconds: 400), () {
        ShowCaseWidget.of(myContext!)!.startShowCase([_one,]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(builder: Builder(builder: (contextBuilder) {
      myContext = contextBuilder;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Showcase(
                key: _one,
                description: "C'est pour faire des mises a jour du compteur",
                onTargetClick: (){
                  Navigator.pop(context);
                },
                disposeOnTap: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove,
                          size: 40,
                        )),
                    Container(
                      height: 150,
                      width: 150,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple,
                      ),
                      child: const Text(
                        '7',
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: 40,
                        ))
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Adjust your water intake goal',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        )),
      );
    }));
  }
}
