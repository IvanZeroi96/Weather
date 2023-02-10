import 'package:cached_network_image/cached_network_image.dart';
import 'package:fever/model/colors.dart';
import 'package:fever/model/ui/f_circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FProgressHUD extends StatelessWidget {
  final bool loading;
  final Widget child;
  final bool whitText;
  final String textLabel;
  final String urlImage;
  final Color backGround;

  const FProgressHUD(
      {super.key,
      required this.loading,
      required this.child,
      this.whitText = false,
      this.textLabel = '',
      this.urlImage = '',
      this.backGround = Colors.white});

  @override
  Widget build(BuildContext context) {
    if (whitText) {
      return Stack(
        children: [
          ModalProgressHUD(
            inAsyncCall: loading,
            progressIndicator: FCircularProgress(),
            color: backGround,
            opacity: 1.0,
            child: child,
          ),
          loading
              ? Center(
                  child: Padding(
                  padding: EdgeInsets.only(top: urlImage.isNotEmpty ? 150 : 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(textLabel,
                          style: Theme.of(context)
                              .primaryTextTheme
                              .headline6!
                              .copyWith(color: FColors.blue2)),
                      const SizedBox(
                        height: 16,
                      ),
                      urlImage.isNotEmpty
                          ? CachedNetworkImage(
                              width: 60,
                              height: 60,
                              fit: BoxFit.scaleDown,
                              imageUrl: urlImage,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.asset(
                                'assets/images/sinimagen.png',
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ))
              : Container()
        ],
      );
    } else {
      return ModalProgressHUD(
        inAsyncCall: loading,
        progressIndicator: FCircularProgress(),
        color: Colors.white,
        child: child,
      );
    }
  }
}
