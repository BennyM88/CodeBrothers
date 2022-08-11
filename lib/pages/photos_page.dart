import 'package:code_brothers/constants.dart';
import 'package:code_brothers/models/photos.dart';
import 'package:code_brothers/pages/details_page.dart';
import 'package:code_brothers/services/network_services/network_service.dart';
import 'package:code_brothers/services/repository_services/photos_repository_service.dart';
import 'package:code_brothers/widgets/image_card.dart';
import 'package:flutter/material.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

NetworkService networkService = NetworkService();

class _PhotosPageState extends State<PhotosPage> {
  late Future<List<Photos>> fetchData;
  @override
  void initState() {
    fetchData = PhotosRepositoryService.getPhotos(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 48) / 3;
    final double itemWidth = size.width / 2;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              fetchData = PhotosRepositoryService.getPhotos(context);
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
                'PHOTOS',
                style: TextStyle(fontSize: titleSize),
              ),
              //list of photos
              Expanded(
                child: FutureBuilder<List<Photos>>(
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
                          return GridView.builder(
                            itemCount: snapshot.data!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: itemWidth / itemHeight),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                        title: snapshot.data![index].title,
                                        url: snapshot.data![index].url,
                                      ),
                                    ),
                                  );
                                },
                                child: customImageCard(
                                    snapshot.data![index].thumbnailUrl),
                              );
                            },
                          );
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
