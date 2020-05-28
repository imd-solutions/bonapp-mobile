import 'package:flutter/material.dart';
import 'package:flutter_bonapp/utils/constants.dart';

class AccountScreen extends StatelessWidget {
  final bool turnOnNotification = false;
  final bool turnOnLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Profile",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.0),
                        boxShadow: [
                          BoxShadow(blurRadius: 3.0, offset: Offset(0, 4.0), color: Colors.black38),
                        ],
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/logo.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Richmond Blankson",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "+233247656959",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        SmallButton(btnText: "Edit"),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Account",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 3.0,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        CustomListTile(
                          icon: Icons.location_on,
                          text: "Location",
                        ),
                        Divider(
                          height: 10.0,
                          color: Colors.grey,
                        ),
                        CustomListTile(
                          icon: Icons.visibility,
                          text: "Change Password",
                        ),
                        Divider(
                          height: 10.0,
                          color: Colors.grey,
                        ),
                        CustomListTile(
                          icon: Icons.shopping_cart,
                          text: "Shipping",
                        ),
                        Divider(
                          height: 10.0,
                          color: Colors.grey,
                        ),
                        CustomListTile(
                          icon: Icons.payment,
                          text: "Payment",
                        ),
//                        Divider(
//                          height: 10.0,
//                          color: Colors.grey,
//                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 3.0,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              Icons.email,
                              color: Color(secondaryColour),
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Switch(
                              value: turnOnNotification,
                              onChanged: (bool value) {},
                            ),
                          ],
                        ),
                        Divider(
                          height: 10.0,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              Icons.phone_android,
                              color: Color(secondaryColour),
                            ),
                            Text(
                              "Text",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            Switch(
                              value: turnOnLocation,
                              onChanged: (bool value) {},
                            ),
                          ],
                        ),
//                        Divider(
//                          height: 10.0,
//                          color: Colors.grey,
//                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final String btnText;

  SmallButton({this.btnText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.0,
      width: 60.0,
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(primaryColour),
          ),
          borderRadius: BorderRadius.circular(20.0)),
      child: Center(
        child: Text(
          "$btnText",
          style: TextStyle(color: Color(primaryColour), fontSize: 16.0),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;

  CustomListTile({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Color(secondaryColour),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            "$text",
            style: TextStyle(fontSize: 15.0, fontFamily: 'Raleway'),
          ),
        ],
      ),
    );
  }
}
