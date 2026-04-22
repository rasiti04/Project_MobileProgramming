import 'package:flutter/material.dart';
import 'package:praktek/data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool showSummary = false;
  bool showExperience = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// BACKGROUND
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://plus.unsplash.com/premium_photo-1661878265739-da90bc1af051?w=600",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Align(
                alignment: Alignment(0, 2),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEGpROvMQ6Hk3tciCh4B_DByz5PLe7pKvbCA&s",
                  ),
                ),
              ),
            ),

            const SizedBox(height: 60),

            const Text(
              "RASITI",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text("Jakarta, Indonesia"),
            const Text("Data Analyst"),

            const SizedBox(height: 20),

            
            // BOX STATS
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Column(
                    children: [
                      Text("20", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        "Projects",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("1.2K", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        "Followers",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("300", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        "Following",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            
            // SUMMARY BOX
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  
                  Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          showSummary = !showSummary;
                        });
                      },
                      child: const Text(
                        "Summary",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                  if (showSummary) ...[
                    const SizedBox(height: 10),
                    Text(
                      summaryData,
                      textAlign: TextAlign.center,
                    ),
                  ]
                ],
              ),
            ),

            const SizedBox(height: 15),

            
            //  EXPERIENCE BOX
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  
                  Center(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          showExperience = !showExperience;
                        });
                      },
                      child: const Text(
                        "Experience",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                  if (showExperience) ...[
                    const SizedBox(height: 10),
                    Text(
                      experienceData,
                      textAlign: TextAlign.left,
                    ),
                  ]
                ],
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}