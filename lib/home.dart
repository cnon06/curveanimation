import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late Animation anime;
  late Animation anime2;
  late AnimationController animationController;
  late Color color;

  @override
  void initState() {
    
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    
    // anime = ColorTween(begin: Colors.amber, end: Colors.red)
    //     .animate(animationController);

  anime= CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    // anime2 = AlignmentTween(begin: const Alignment(-1, -1), end: const Alignment(1, 1))
    //     .animate(CurvedAnimation(parent: animationController, curve: Curves.bounceInOut));

    
anime2 = AlignmentTween(begin: const Alignment(-1, -1), end: const Alignment(1, 1))
        .animate(anime as dynamic);
  
   
    animationController.addListener(() {
      setState(() {
    
      });
    });

    animationController.addStatusListener((status) {
      setState(() {
        debugPrint(status.toString());
      });
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Material App  Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Container(
          alignment: anime2.value,
          height: 200,
          child: const Text('Sinem'),
        ),
        Text('Flutter',style: TextStyle(fontSize: anime.value*100),),
        const SizedBox(height: 30,),
        ElevatedButton(
            onPressed: () {
              animationController.forward(from: 0);
              
            },
            child: const Text('Start')),
          ],
        ),
      ),
    );
  }
}