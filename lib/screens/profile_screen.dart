import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget buildListItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {}, // Placeholder
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Profile avatar with local image
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 14,
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Prem Kumar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Host Experience Card (without image)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF5F2),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Host your own Experience",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 4),
                    Text("Share your passions and adventures with others!"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Account Settings", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            buildListItem(Icons.person, "View My Public Profile"),
            buildListItem(Icons.edit, "Edit Profile Information"),
            buildListItem(Icons.notifications, "Notifications"),
            buildListItem(Icons.favorite, "My Interests"),
            buildListItem(Icons.location_on, "My Destinations"),
            buildListItem(Icons.favorite_border, "My Favourites"),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Support", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            buildListItem(Icons.play_circle_fill, "How to Yoliday"),
            buildListItem(Icons.support_agent, "Yoliday Assist"),
            buildListItem(Icons.swap_horiz, "Transaction History"),
            buildListItem(Icons.contact_page, "Contact Us"),
            buildListItem(Icons.privacy_tip, "Privacy Policy"),
            buildListItem(Icons.question_answer, "FAQ"),
            buildListItem(Icons.bug_report, "Send Bug Report"),
            buildListItem(Icons.delete_outline, "Delete account"),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout),
                label: const Text("Log out"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.grey.shade200,
                  elevation: 0,
                  minimumSize: const Size(double.infinity, 48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
