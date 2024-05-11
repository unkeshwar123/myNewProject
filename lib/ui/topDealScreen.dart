import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:p_assignment/util/connectivitycontroller.dart';
import 'package:p_assignment/viewModel/dealViewMode.dart';
import 'package:retrofit/retrofit.dart';


class TopDealsScreen extends StatefulWidget {
  @override
  _TopDealsScreenState createState() => _TopDealsScreenState();
}

class _TopDealsScreenState extends State<TopDealsScreen> {
  final _postViewModel = Get.put(DealViewModel());
  final ConnectivityController _connectivityController = Get.find();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    //refreshData();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!_postViewModel.isLoading.value) {
        _postViewModel.fetchData();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
          () =>  Stack(children: [

              RefreshIndicator(
              child: Column(children: [
                Expanded(
                    child: !_postViewModel.isLoading.value
                        ? ListView.builder(
                            controller: _scrollController,
                            itemCount: _postViewModel.deals.length,
                            itemBuilder: (context, index) {
                              return dealitem(index);
                            },
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          )),
                if (_postViewModel.bottomloadingisLoading.value)
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircularProgressIndicator.adaptive(),
                  ),
              ]),
              onRefresh: () async {
                _postViewModel.refresh();
              }),

            if(!_connectivityController.isConnected.value)
              Container(
                color: Colors.black54,
                child: Center(
                  child: Text('No Internet Please Connect Your device to WIFI or On your Mobile data',style: TextStyle(color: Colors.redAccent,fontSize: 20),textAlign: TextAlign.center,),
                ),
              ),
          ],)
        );
  }

  Widget dealitem(index) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                fit: BoxFit.fitWidth,
                height: 70,
                width: 70,
                imageUrl: _postViewModel.deals[index].image_medium ?? '',
                errorWidget: (context, url, error) {
                  final errorWidget = Image.asset('assets/paritycube_logo.jpeg',
                      fit: BoxFit.fill);
                  return Image.network(
                      _postViewModel.deals[index].image_medium,
                      fit: BoxFit.fill,
                      errorBuilder: (_, __, ___) => errorWidget);
                },
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'The Item is now available',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Icon(Icons.thumb_up_alt_rounded, size: 20, color: Colors.black38),
              SizedBox(
                width: 3,
              ),
              Text(
                '5',
                style: TextStyle(fontSize: 14, color: Colors.black38),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.forum_sharp, size: 20, color: Colors.black38),
              SizedBox(
                width: 3,
              ),
              Text(
                _postViewModel.deals[index].comments_count.toString(),
                style: TextStyle(fontSize: 14, color: Colors.black38),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.access_time_sharp, size: 20, color: Colors.black38),
              SizedBox(
                width: 3,
              ),
              Text(
                getDate(_postViewModel.deals[index].created_at_in_millis),
                style: TextStyle(fontSize: 14, color: Colors.black38),
              ),
              Spacer(),
              Text(
                _postViewModel.deals[index].store?.name ?? 'At other',
                style: TextStyle(fontSize: 14, color: Colors.lightBlue),
              ),
            ],
          )
        ],
      ),
    );
  }

  getDate(int milis) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milis);

    // Format the DateTime object into a readable string
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate;
  }
}
