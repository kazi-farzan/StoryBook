import 'package:flutter/material.dart';
import 'package:storybook/story_brain.dart';

const Color ebony = Color(0xFF585839);
const Color blackOlive = Color(0xFF3B3A36);

void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'One fateful night,',
          style: TextStyle(fontFamily: 'Fira Sans'),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Adjust as needed
                      color: Colors.white.withOpacity(
                          0.2), // Adjust opacity for the glassy effect
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(
                              0.5), // Adjust shadow color for the glassy effect
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      storyBrain.getStory() ?? 'No question found ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'Cormorant',
                      ),
                    ),
                  ),
                ),
              ), //Story Text
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    //Choice 1 made by user.
                    storyBrain.nextStory(1);
                    setState(() {
                      storyBrain.getStory();
                      storyBrain.getChoice1();
                      storyBrain.getChoice2();
                    });
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(blackOlive),
                  ),
                  child: Text(
                    storyBrain.getChoice1() ?? 'choice1',
                    //'Choice 1',
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: 'AlegreyaSans',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      storyBrain.nextStory(2);
                      setState(() {
                        storyBrain.getStory();
                        storyBrain.getChoice1();
                        storyBrain.getChoice2();
                      });
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(ebony),
                    ),
                    child: Text(
                      storyBrain.getChoice2() ?? 'Choice 2',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'AlegreyaSans',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
