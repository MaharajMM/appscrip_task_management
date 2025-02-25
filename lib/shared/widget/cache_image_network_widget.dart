import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CacheNetworkImageWidget extends StatefulWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const CacheNetworkImageWidget({
    super.key,
    this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.fill,
  });

  @override
  State<CacheNetworkImageWidget> createState() => _CacheNetworkImageWidgetState();
}

class _CacheNetworkImageWidgetState extends State<CacheNetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.imageUrl != null && widget.imageUrl!.isNotEmpty
        ? CachedNetworkImage(
            // cacheManager: customCacheManager,
            key: ValueKey(widget.imageUrl),
            fit: widget.fit,
            height: widget.height,
            width: widget.width,
            imageUrl: widget.imageUrl!,
            placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )
        : const Icon(Icons.error);
  }
}
