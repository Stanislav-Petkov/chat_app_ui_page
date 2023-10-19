import 'package:chat_app_ui_page/user.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Messages', 'Calls', 'Group', 'Create'];
    return Scaffold(
      backgroundColor: const Color(0xff105946),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Chat with\nfriends',
                    style: TextStyle(
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        if (index == 0) {
                          return const CircleAvatar(
                            radius: 35,
                            backgroundColor: Color(0xff427C6E),
                            child: Icon(
                              Icons.search,
                              size: 35,
                              color: Colors.white,
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: const Color(0xff427C6E),
                            backgroundImage:
                                NetworkImage(users[index].photoUrl),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 35,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tabs.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return Row(
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.amber,
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                tabs[index],
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                            ],
                          );
                        } else if (index == tabs.length - 1) {
                          return Container(
                            padding: const EdgeInsets.fromLTRB(15, 4, 15, 4),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xff427C6E),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Text(
                              tabs[index],
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(7),
                          child: Text(
                            tabs[index],
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: users[index].activeMsg
                          ? Stack(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 37,
                                  backgroundImage:
                                      NetworkImage(users[index].photoUrl),
                                ),
                                Positioned(
                                  left: 13,
                                  child: Container(
                                    height: 13,
                                    width: 13,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.amber,
                                    ),
                                  ),
                                )
                              ],
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 37,
                              backgroundImage:
                                  NetworkImage(users[index].photoUrl),
                            ),
                      title: Row(
                        children: [
                          Text(
                            users[index].name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            users[index].time,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[500],
                            ),
                          )
                        ],
                      ),
                      subtitle: Text(users[index].message),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
