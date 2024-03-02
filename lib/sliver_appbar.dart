import 'package:flutter/material.dart';

class SliverAppbar extends StatefulWidget {
  const SliverAppbar({super.key});

  @override
  State<SliverAppbar> createState() => _SliverAppbarState();
}

class _SliverAppbarState extends State<SliverAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
            backgroundColor: Colors.blueGrey,
            floating: false,
            // pinned: true,
            toolbarHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
                title: Center(
              child: Text("This is SliverAppbar",
                  style: TextStyle(color: Colors.black)),
            )
                // background:
                )),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Container(
              height: 100,
              margin: EdgeInsets.all(10),
              color: Colors.blue,
            );
          },
          childCount: 10,
        ))
      ]),
    );
  }
}
