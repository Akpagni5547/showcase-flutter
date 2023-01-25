import 'package:flutter/material.dart';
import 'package:showcase_packkage/screens/detail_page.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey _one = GlobalKey();
  GlobalKey _two = GlobalKey();
  GlobalKey _three = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => ShowCaseWidget.of(context).startShowCase([_one, _two, _three]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Showcase.withWidget(
        key: _three,
        container: const Icon(
          Icons.person,
          size: 30,
          color: Colors.white,
        ),
        height: 50,
        width: 50,
        targetShapeBorder: const CircleBorder(),
        targetPadding: const EdgeInsets.all(15),
        child: FloatingActionButton(
          onPressed: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (_) => const DetailPage()));
          },
          child: const Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        title: const Text('💧Water tracker'),
        leading: IconButton(
            onPressed: () {
              setState(() {
                ShowCaseWidget.of(context)!.startShowCase([_one, _two, _three]);
              });
            },
            icon: const Icon(Icons.info)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Showcase(
              key: _one,
              title: 'Setting',
              description: "Ici pour avoir les informations utiles",
              onTargetClick: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => const DetailPage()));
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const DetailPage())).then((_) {
                      setState(() {
                        ShowCaseWidget.of(context)!.startShowCase([_two, _three]);
                      });
                });
              },
              disposeOnTap: true,
              child: Container(
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DetailPage()));
                    }, icon: const Icon(Icons.settings)),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Showcase(
              key: _two,
              description: "C'est une description bien faite",
              title: "Titre",
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.purple,
                    ),
                    child: const Text(
                      '7',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Water Intake Goal',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.local_drink,
                        color: Colors.lightBlueAccent,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.local_drink,
                        color: Colors.lightBlueAccent,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.local_drink,
                        color: Colors.grey,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.local_drink,
                        color: Colors.grey,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.local_drink,
                        color: Colors.grey,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.local_drink,
                        color: Colors.grey,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.local_drink,
                        color: Colors.grey,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
