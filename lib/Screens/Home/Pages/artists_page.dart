import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:portal/Services/api_service.dart';

class ArtistsPage extends StatelessWidget {
  const ArtistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.getArtists(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurpleAccent,
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'An ${snapshot.error} occurred',
                      style: const TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  );
                } else if (snapshot.hasData) {
                  QuerySnapshot<Map<String, dynamic>>  data = snapshot.data;
                  if (data.docs.isNotEmpty){
                    List<Widget> artists = [];
                    for (QueryDocumentSnapshot artist in data.docs) {
                      artists.add(
                        Padding(
                          padding: EdgeInsets.all(64),
                          child: Card(
                            color: Colors.black,
                            child: SizedBox(
                              child: Column(
                                children : [
                                  Image.network('https://firebasestorage.googleapis.com/v0/b/portal-410523.appspot.com/o/artists%2Fzzzzzzzzzzzzzzzzzzzy%2Fprofile.jpg?alt=media&token=c6894224-5ca7-4d6d-bb85-2d46743fcd25'),
                                ]
                                
                              )),
                            

                            ),
                        )
                      );
                      
                    }
                    return Center(
                      child: GridView.count(
                        crossAxisCount: 3,
                        children: artists,
                                                ),
                    );
                  }
                  else {
                    return Center(
                      child: ElevatedButton(
                        onPressed: (){}, 
                        child: Text("Create New Artist")),
                    );
                  }
                }
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}