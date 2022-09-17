import 'package:flutter/material.dart';
import 'package:flutter_devcamp/helpers/app_constants.dart';
import 'package:flutter_devcamp/models/image_data.dart';
import '../helpers/utilities.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/banner_image.jpg",
            height: context.height / 3,
            width: double.maxFinite,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: AppConstants.items
                .map(
                  (e) => Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      e,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Popular Destinations",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: context.height,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: datalist.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemBuilder: (context, index) {
                  return ImageItem(
                    data: datalist[index],
                  );
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}

class ImageItem extends StatelessWidget {
  final Data data;
  const ImageItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              data.cityImage,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.all(5),
            color: Theme.of(context).primaryColor,
            child: Text(
              data.cityName.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
