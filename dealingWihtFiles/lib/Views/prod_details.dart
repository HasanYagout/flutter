import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/Models/ProdModel.dart';
import 'package:flutter/material.dart';

class ProdDetails extends StatefulWidget {
  const ProdDetails({Key? key, required this.prodModel}) : super(key: key);
  final ProdModel prodModel;

  @override
  State<ProdDetails> createState() => _ProdDetailsState();
}

class _ProdDetailsState extends State<ProdDetails> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("${widget.prodModel.title}"),),
      body: ListView.builder(
        itemCount: widget.prodModel.images!.length,
        itemBuilder: (context, index) => CachedNetworkImage(
          imageUrl: widget.prodModel.images![index],
          placeholder: (context, url) => Image.asset("assets/images/loading.gif"),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),),
    );
  }
}
