import 'molecule.dart';
const String FILEPATH = "elements.json";

class Element {
	final String _symbol;
	final String _name;
	final String _latinName;
	final int _weight;

	Element(
    {required int weight,
    required String symbol,
    required String name,
    required String latinName}
  )  : _weight = weight,
        _symbol = symbol,
        _name = name,
        _latinName = latinName;
        
	String get symbol => Atom(_symbol).toString();
  String get name => _name;
  String get latinName => _latinName;
  int get weight => _weight;
}