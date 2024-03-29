import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BackgroundImage extends StatelessWidget {
  final String image;
  final bool isAssetImage;
  const BackgroundImage({Key? key, required this.image, required this.isAssetImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isAssetImage
        ? Image.asset(
            image,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          )
        : CachedNetworkImage(
            imageUrl: image,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            progressIndicatorBuilder: (context, url, downloadProgress) => const SpinKitDualRing(color: Colors.amberAccent),
          );
  }
}
