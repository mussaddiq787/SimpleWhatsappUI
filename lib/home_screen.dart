import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp'),
         backgroundColor: Colors.teal,
          bottom: const TabBar(
            indicatorColor: Colors.white, // Indicator color
            labelColor: Colors.white, // Color of the selected tab text
            unselectedLabelColor: Colors.white70, // Color of the unselected tab text
            indicatorWeight : 4.0,
            indicatorSize: TabBarIndicatorSize.tab, // increase the length of indicator line
            tabs: <Widget>[
              // Text('Chats'),
              // Text('Chats'),
              // Text('Status'),
              // Text('Calls'),
              Tab(
                child: Icon(Icons.camera_alt),
              ),
              Tab(text: 'Chats'),
              Tab(text: 'Status'),
              Tab(text: 'Calls'),
            ],
          ),
          actions: [
            Icon(Icons.search),
            SizedBox(width: 10,),
            PopupMenuButton(
                icon: Icon(Icons.more_vert_outlined),
                itemBuilder: (context,) => const [
                  PopupMenuItem(
                      value: '1',
                      child: Text('New Group')
                  ),
                  PopupMenuItem(
                      value: '2',
                      child: Text('Setting')
                  ),
                  PopupMenuItem(
                      value: '3',
                      child: Text('Logout')
                  ),
                  PopupMenuItem(
                      value: '2',
                      child: Text('Starred Message')
                  ),
                  PopupMenuItem(
                      value: 5,
                      child: Text('Mussaddiq Profile')
                  ),
                ]
            ),
            SizedBox(width: 10,),
          ],
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Camera')),
            ListView.builder( // for chat screen
              itemCount: 100,
                itemBuilder: (context, index){
                  return const ListTile(
                    leading:  CircleAvatar(
                      backgroundImage: NetworkImage('https://images.pexels.com/photos/103123/pexels-photo-103123.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    ),
                    title: Text('Mussaddiq'),
                    subtitle : Text('Where is my phone'),
                    trailing: Text('11:34'),
                  );
            }),
            ListView.builder( // this is for status screen
                itemCount: 2,
                itemBuilder: (context, index){
                  if (index == 0 ){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Text('New Updates'),
                          ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.green,
                                  width: 4.0,
                                ),
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage('https://images.pexels.com/photos/103123/pexels-photo-103123.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                              ),
                            ),
                            title: Text('Mussaddiq'),
                            subtitle : Text('35m ago'),
                          ),
                        ],
                      ),
                    );
                  }else{
                    return ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.green,
                            width: 4.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage('https://images.pexels.com/photos/103123/pexels-photo-103123.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        ),
                      ),
                      title: Text('Mussaddiq'),
                      subtitle : Text('35m ago'),
                    );
                  };
                }),
            ListView.builder( // this is for calls screen
                itemCount: 100,
                itemBuilder: (context, index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('https://images.pexels.com/photos/103123/pexels-photo-103123.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    ),
                    title: Text('Mussaddiq'),
                    subtitle : Text(index /2 ==0 ? 'You Missed audio Call' : 'You missed Video call'),
                    trailing: Icon(index /2 ==0 ? Icons.phone: Icons.video_call),
                  );
                }),
          ],
        ),

      ),
    );
  }
}
