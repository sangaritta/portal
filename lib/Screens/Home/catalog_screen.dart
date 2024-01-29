import 'package:flutter/cupertino.dart';
import 'package:portal/Services/api_service.dart';
import 'package:portal/Services/auth_service.dart';
import 'package:portal/Services/storage_service.dart';
import 'package:portal/Widgets/release_widget.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: api.getCatalog(),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.done) {
            // If we got an error
            if (s.hasError) {
              return Center(
                child: Text(
                  '${s.error} occurred',
                  style: const TextStyle(fontSize: 18),
                ),
              );

              // if we got our data
            } else if (s.hasData) {
              // Extracting data from snapshot object
              Map<String, dynamic>? data = s.data!.data();
              List catalog = data!['catalog'];
              return Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: ListView.builder(

                  itemCount: catalog.length ,
                  itemBuilder: (c, i){
                    return Center(child: Release(url: 'https://m.media-amazon.com/images/I/41BEY-M-gSL._UXNaN_FMjpg_QL85_.jpg'));

                }),
              );
              
            }
            
          }
          return const Center(
              child: CupertinoActivityIndicator(),
            );
        });
  }
}
