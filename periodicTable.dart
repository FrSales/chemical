import 'dart:io';
import 'dart:convert';
import 'element.dart';
const String FILEPATH = "elements.json";
//List elementsList = [];
class PeriodicTable {
	//static PeriodicTable? _instance;
	static var elements = _mapElements();
	//PeriodicTable._();
	//factory PeriodicTable() => elements = elements1();
		//Map get elements => _elements;
	static Map _mapElements(){
    var jsonString = File(FILEPATH).readAsStringSync();
		final List jsonlistmap = JsonDecoder().convert(jsonString);
    	//print(jsonlistmap);
		var gg = 0;
		Map allElements = {};
		for(var i in jsonlistmap) {
			allElements[gg.toString()] = Element(symbol: i["symbol"], name: i["name"], latinName: i["latinName"], weight: int.parse(i["weight"]));
			//print(elements["$gg"]);
			gg++;
		}
    	//print(elements);
		return allElements;
		}	
}