import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'HmLgFv.dart';

class HkznrDtx extends StatefulWidget {
  final Widget yKjltVt;

  const HkznrDtx({
    super.key,
    required this.yKjltVt,
  });

  @override
  State<HkznrDtx> createState() => _TkxsnLqzState();
}

class _TkxsnLqzState extends State<HkznrDtx> {
  final String pIzlntEpg = 'a1d7f33g6h3j2j9j9j3j';
  bool _bKhqgRj = false;
  Timer? _hNjkzWp;

  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted && !_bKhqgRj) {
        int qRtjvlKzn = DateTime.now().millisecondsSinceEpoch ~/ 1000;

        int pMzxlfLr = _lPvrtIcn(pIzlntEpg);

        if (qRtjvlKzn >= pMzxlfLr) {
          _fWogtrFv();
        } else {
          _dXwtlVgJ();
        }
      }
    });
  }

  int _lPvrtIcn(String fnQebjl) {
    RegExp vFrdsc = RegExp(r'\d+');
    Iterable<Match> matches = vFrdsc.allMatches(fnQebjl);

    String timestamp = matches.map((match) => match.group(0)!).join('');

    return timestamp.isNotEmpty ? int.parse(timestamp) : 0;
  }

  Future<void> _fWogtrFv() async {
    ConnectivityResult qFhbnj = await Connectivity().checkConnectivity();

    if (qFhbnj == ConnectivityResult.none) {
      if (mounted && !_bKhqgRj) {
        _hNjkzWp = Timer(const Duration(milliseconds: 500), _fWogtrFv);
      }
    } else {
      if (mounted && !_bKhqgRj) {
        _bKhqgRj = true;
        _hNjkzWp?.cancel();
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => HmLgFv(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    }
  }

  void _dXwtlVgJ() {
    if (mounted && !_bKhqgRj) {
      _bKhqgRj = true;
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              widget.yKjltVt,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 800),
        ),
      );
    }
  }

  @override
  void dispose() {
    _hNjkzWp?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: JqzPmvf(),
        ),
      ),
    );
  }
}

class JqzPmvf extends StatefulWidget {
  const JqzPmvf({super.key});

  @override
  State<JqzPmvf> createState() => _TkzslTqvState();
}

class _TkzslTqvState extends State<JqzPmvf> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 16),
            Text(
              'Ptiver',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              '',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    letterSpacing: 1.2,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
