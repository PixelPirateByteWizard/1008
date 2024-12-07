import 'dart:ui';

Color pVtHg6dF(String kLrWt8zQ) {
  
  String vNxGp5bK = kLrWt8zQ.replaceAll('Color(', '').replaceAll(')', '');

  
  List<String> wLtHp9sV = vNxGp5bK.split(',');

  int qZfNb1mP = int.parse(wLtHp9sV[0].trim());
  int gPlEj3aT = int.parse(wLtHp9sV[1].trim());
  int xFbTq7mC = int.parse(wLtHp9sV[2].trim());
  double nXjPz4vK = double.parse(wLtHp9sV[3].trim());

  
  return Color.fromRGBO(qZfNb1mP, gPlEj3aT, xFbTq7mC, nXjPz4vK);
}
