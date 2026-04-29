import 'package:flutter/material.dart';

import 'login.dart';
void main() {
  runApp(EventsApp());
}
class EventsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeddingSplashScreen(),
    );
  }
}

class WeddingSplashScreen extends StatefulWidget {
  @override
  _WeddingSplashScreenState createState() =>
      _WeddingSplashScreenState();
}

class _WeddingSplashScreenState extends State<WeddingSplashScreen> {
  bool isBig = false;
  bool isRunning = true;

  @override
  void initState() {
    super.initState();

    startAnimation();

    Future.delayed(Duration(seconds: 5), () {
      isRunning = false;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Page2()),
      );
    });
  }

  void startAnimation() async {
    while (isRunning) {
      await Future.delayed(Duration(milliseconds: 500));
      if (!mounted) return;

      setState(() {
        isBig = !isBig;
      });
    }
  }

  @override
  void dispose() {
    isRunning = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("skip"),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedScale(
              scale: isBig ? 1.2 : 1,
              duration: Duration(milliseconds: 500),
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 30),

            Text(
              'Events Hall Finder',
              style: TextStyle(fontSize: 35),
            ),

            SizedBox(height: 10),

            Text(
              'Find your perfect venue',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}


class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Skip'),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search,
                size: 120,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Discover Perfect Venues",
              style: TextStyle(fontSize: 35),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10),

            Text(
              "Browse hundreds of stunning Event halls tailored to your dream celebration",
              style: TextStyle(fontSize: 20, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen3()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}



class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("skip"),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(height: 40),

          CircleAvatar(
            radius: 120,
            backgroundColor: Colors.pink,
            child: Icon(
              Icons.attach_money,
              color: Colors.white,
              size: 110,
            ),
          ),

          SizedBox(height: 20),

          Text(
            "Compare Prices",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "Find the best deals and packages that fit your budget perfectly",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen4()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
              child: Text(
                "Next",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text("skip"),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [



          SizedBox(height: 40),

          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.pink,
            child: Icon(
              Icons.calendar_today,
              color: Colors.white,
              size: 40,
            ),
          ),

          SizedBox(height: 20),

          Text(
            "Book Instantly",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "Reserve your favorite venue in just a few taps with instant confirmation",style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),

          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
              child: Text(
                "Next",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

}