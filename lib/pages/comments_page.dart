import 'package:code_brothers/constants.dart';
import 'package:code_brothers/models/comments.dart';
import 'package:code_brothers/services/repository_services/comments_repository_service.dart';
import 'package:code_brothers/widgets/comments_card.dart';
import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  late Future<List<Comments>> fetchData;
  @override
  void initState() {
    fetchData = CommentsRepositoryService.getComments(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              fetchData = CommentsRepositoryService.getComments(context);
            });
          }),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              //title
              const Text(
                'COMMENTS',
                style: TextStyle(fontSize: titleSize),
              ),
              //list of comments
              Expanded(
                child: FutureBuilder<List<Comments>>(
                  future: fetchData,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.done:
                      default:
                        if (snapshot.hasData) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return customCommentCard(
                                    snapshot.data![index].name,
                                    snapshot.data![index].email,
                                    snapshot.data![index].body);
                              });
                        } else {
                          return const Center(
                            child: Text('no data'),
                          );
                        }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
