

import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int ticketQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        width: double.infinity,
        color: const Color(0xFF1C1D26),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'THE MATRIX (1999) (15)',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Southsea Cinema Room',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              'Monday 12th Ocotober 19:30',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),

            const SizedBox(height: 30),

            const SizedBox(height: 15),

            const Text(
              'A lonely man called Neo finds the truth about his world',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),

            const SizedBox(height: 20),

            const Text(
              'Select Quantities (Up to 5 in total)',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),

            const SizedBox(height: 30),

            const Text(
              'Tickets',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                DropdownButton<int>(
                  value: ticketQuantity,
                  items: [0, 1, 2, 3, 4, 5].map((int quantity) {
                    return DropdownMenuItem<int>(
                      value: quantity,
                      child: Text(quantity.toString()),
                    );
                  }).toList(),
                  onChanged: (int? value) {
                    setState(() {
                      ticketQuantity = value!;
                    });
                  },
                ),

                const SizedBox(width: 15),

                const Text(
                  'Adult (£7.50)',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                if (ticketQuantity > 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Total price: £${(ticketQuantity * 7.50).toStringAsFixed(2)}',
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: cinemaBrand,
                foregroundColor: Colors.white,
              ),
              child: const Text('ADD TO ORDER'),
            ),
          ],
        ),
      ),
    );
  }
}

