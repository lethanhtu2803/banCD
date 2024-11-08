import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectmobile/entities/user.dart';
import 'package:projectmobile/page/account/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PersonalPage(),
    );
  }
}

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  User? user;
  @override
  void initState() {
    super.initState();
    loadData();
  }
  void loadData() async{
    var shared = await SharedPreferences.getInstance();


      if(shared.getString("user1") != null) {
        var user_string = shared.getString("user1");
        var loadUser = User.fromMap(jsonDecode(user_string!));
        setState(() {
          user = loadUser;
        });

    };
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "T-Shop",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150'), // Thay bằng hình ảnh người dùng thực tế
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, ${user!.fullName}",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "sepide@pigo.design",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfilePage(),
                          ));
                    },
                    icon: Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Starter Plan",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple),
                        ),
                        Text(
                          "All features unlocked!",
                          style: TextStyle(
                              fontSize: 14, color: Colors.deepPurple[700]),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Upgrade",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Account",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.shopping_bag_outlined, color: Colors.black),
              title: Text("Orders",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              trailing:
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.replay_outlined, color: Colors.black),
              title: Text("Returns",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              trailing:
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite_border, color: Colors.black),
              title: Text("Wishlist",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              trailing:
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag_outlined, color: Colors.black),
              title: Text("Addresses",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              trailing: Icon(Icons.location_on_outlined,
                  size: 16, color: Colors.grey),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(Icons.payment, color: Colors.black),
              title: Text("Payment",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              trailing:
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () {
              },
            )
          ],
        ),
      ),
    );
  }


}

class AccountItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const AccountItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
      },
    );
  }
}
