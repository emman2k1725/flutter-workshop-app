import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_workshop_app/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> _threadsStream =
      FirebaseFirestore.instance.collection('thread').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: true,
            expandedHeight: 100.0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: SvgPicture.asset(
                  'assets/threads-logo.svg',
                ),
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: _threadsStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: Text('Error: ${snapshot.error}'),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              final List<Map<String, dynamic>> threads = snapshot.data!.docs
                  .map((DocumentSnapshot document) => {
                        'id': document.id,
                        ...document.data() as Map<String, dynamic>,
                      })
                  .toList();

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Column(
                      children: [
                        ThreadContainer(threadData: threads[index]),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey[200],
                          ),
                        ),
                      ],
                    );
                  },
                  childCount: threads.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
