import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DemoFadeInImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          /// 带有占位图的图片加载方案
          FadeInImage.assetNetwork(
            placeholder: "assets/loading.png",
            image:
                "http://g.hiphotos.baidu.com/image/pic/item/c2cec3fdfc03924590b2a9b58d94a4c27d1e2500.jpg",
            height: 80.0,
            width: 80.0,
          ),

          /// 第三方的带有占位图的图片加载方案
          CachedNetworkImage(
            height: 80.0,
            width: 80.0,
            imageUrl:
                "http://g.hiphotos.baidu.com/image/pic/item/c2cec3fdfc03924590b2a9b58d94a4c27d1e2500.jpg",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          )
        ],
      ),
    );
  }
}
