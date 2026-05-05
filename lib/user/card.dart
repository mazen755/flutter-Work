import 'package:flutter/material.dart';

void main() {
  runApp(card());
}

class card extends StatelessWidget {
  card({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PageOne(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageOne extends StatefulWidget {
  PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      ImgSlider(),

                      /// ✅ FIX هنا
                      Positioned(
                        top: 15,
                        left: 15,
                        right: 15,
                        child: Nav(),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Crystal Ballroom",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A374D),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF7E6),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.star, color: Colors.orange, size: 18),
                                  SizedBox(width: 4),
                                  Text("4.9", style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 4),

                        const Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: 18, color: Colors.grey),
                            Text(" Downtown, Manhattan", style: TextStyle(color: Colors.grey)),
                          ],
                        ),

                        const SizedBox(height: 25),

                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Color(0xFFF9F5FF),
                              child: Icon(Icons.group_outlined, color: Colors.purple, size: 20),
                            ),
                            const SizedBox(width: 10),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Capacity", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                Text("200-300 guests", style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(width: 30),
                            const CircleAvatar(
                              backgroundColor: Color(0xFFF9F5FF),
                              child: Icon(Icons.star_outline, color: Colors.purple, size: 20),
                            ),
                            const SizedBox(width: 10),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Reviews", style: TextStyle(color: Colors.grey, fontSize: 12)),
                                Text("234", style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 25),
                        const Divider(color: Color(0xFFEEEEEE)),
                        const SizedBox(height: 25),

                        const Text("Description",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                        const SizedBox(height: 10),

                        const Text(
                          "An elegant and sophisticated ballroom featuring crystal chandeliers, marble floors, and floor-to-ceiling windows with stunning city views. Perfect for grand celebrations.",
                          style: TextStyle(color: Colors.grey, height: 1.5),
                        ),

                        const SizedBox(height: 25),

                        const Text("Amenities",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                        const SizedBox(height: 12),

                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            _buildSimpleChip("Parking"),
                            _buildSimpleChip("Catering"),
                            _buildSimpleChip("Decoration"),
                            _buildSimpleChip("Sound System"),
                            _buildSimpleChip("AC"),
                          ],
                        ),

                        const SizedBox(height: 25),

                        const Text("Available Dates",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                        const SizedBox(height: 12),

                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9F5FF),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.calendar_today_outlined, color: Colors.purple),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Check availability", style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text("View calendar for booking dates",
                                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Bottom Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price per night",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 12)),
                    Text("\$5,000",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent)),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Center(child: Text("push")),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD870F3),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Text(
                      "Book Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F5FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.purple, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class ImgSlider extends StatefulWidget {
  const ImgSlider({super.key});

  @override
  State<ImgSlider> createState() => _ImgSliderState();
}

class _ImgSliderState extends State<ImgSlider> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: PageView(
        children: [
          Image.network("https://images.unsplash.com/photo-1759519238029-689e99c6d19e?...", fit: BoxFit.cover),
          Image.network("https://images.unsplash.com/photo-1670529776286-f426fb7ba42c?...", fit: BoxFit.cover),
          Image.network("https://images.unsplash.com/photo-1712314947761-a8d718bd8c32?...", fit: BoxFit.cover),
        ],
      ),
    );
  }
}

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  bool Favorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, size: 17, color: Colors.black),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: IconButton(
            onPressed: () {
              setState(() {
                Favorite = !Favorite;
              });
            },
            icon: Icon(
              Favorite ? Icons.favorite_rounded : Icons.favorite_border,
              size: 20,
              color: Favorite ? Colors.red : Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}