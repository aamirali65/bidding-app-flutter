import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gobidder/widgets/customText.dart';
import 'package:gobidder/widgets/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // You can later fetch these from Firebase or API
  final String imageUrl = "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg"; // Example image
  final String userName = "John Doe";
  final String userEmail = "johndoe@example.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: MyText(
          text: "Profile",
          color: ThemeColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                title: MyText(
                  text: userName,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                subtitle: MyText(
                  text: userEmail,
                  fontSize: 14,
                  color: Colors.grey[700]!,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10,),
              const Divider(thickness: 1),
              const SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  color: ThemeColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: ThemeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: "Complete Your Profile!",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: 0.33, // 1/3 completed
                          minHeight: 10,
                          backgroundColor: Colors.black45,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                      const SizedBox(height: 8),
                      MyText(
                        text: "(1/3) Email not verified",
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                )
                  ,
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Text("Rewards",style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.w600),)
                ],
              ),
              const SizedBox(height: 10,),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: MyText(text: "My Bid", color: Colors.grey.shade700, fontSize: 16, fontWeight: FontWeight.w600),
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ThemeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(FontAwesomeIcons.circleChevronUp,color: Colors.white,size: 20,),
                ),
                trailing: Icon(Icons.chevron_right),
              ),
              const Divider(thickness: 1),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: MyText(text: "Referral", color: Colors.grey.shade700, fontSize: 16, fontWeight: FontWeight.w600),
                leading: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ThemeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(FontAwesomeIcons.tag,color: Colors.white,size: 20,),
                ),
                trailing: Icon(Icons.chevron_right),
              ),
              SizedBox(height: 10,),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: MyText(text: "Profile Setting", color: Colors.grey.shade800, fontSize: 16, fontWeight: FontWeight.w600),
                trailing: Icon(Icons.chevron_right),
              ),
              const Divider(thickness: 1),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: MyText(text: "Language", color: Colors.grey.shade800, fontSize: 16, fontWeight: FontWeight.w600),
                trailing: Icon(Icons.chevron_right),
              ),
              const Divider(thickness: 1),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: MyText(text: "Logout", color: Colors.grey.shade800, fontSize: 16, fontWeight: FontWeight.w600),
                trailing: Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
