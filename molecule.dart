List<String> elementSymbols = [
    'H', 'He', 'Li', 'Be', 'B', 'C', 'N', 'O', 'F', 'Ne', 'Na', 'Mg', 'Al', 'Si', 'P', 'S', 'Cl', 'K', 'Ar',
    'Ca', 'Sc', 'Ti', 'V', 'Cr', 'Mn', 'Fe', 'Ni', 'Co', 'Cu', 'Zn', 'Ga', 'Ge', 'As', 'Se', 'Br', 'Kr', 'Rb', 'Sr',
    'Y', 'Zr', 'Nb', 'Mo', 'Tc', 'Ru', 'Rh', 'Pd', 'Ag', 'Cd', 'In', 'Sn', 'Sb', 'Te', 'I', 'Xe', 'Cs', 'Ba', 'La',
    'Ce', 'Pr', 'Nd', 'Pm', 'Sm', 'Eu', 'Gd', 'Tb', 'Dy', 'Ho', 'Er', 'Tm', 'Yb', 'Lu', 'Hf', 'Ta', 'W', 'Re', 'Os',
    'Ir', 'Pt', 'Au', 'Hg', 'Tl', 'Pb', 'Bi', 'Th', 'Pa', 'U', 'Np', 'Pu', 'Am', 'Cm', 'Bk', 'Cf', 'Es', 'Fm', 'Md',
    'No', 'Lr', 'Rf', 'Db', 'Sg', 'Bh', 'Hs', 'Mt', 'Ds', 'Rg', 'Cn', 'Nh', 'Fl', 'Mc', 'Lv', 'Ts', 'Og','Ac','At','Fr','Po','Ra','Rn'
  ];

 Map<String, double> atomicWeights= {
  "Rn": 86,
  "Ra": 88,
  "Po": 84,
  "Fr": 87,
  "At": 85,
  "Ac": 89,
  "H": 1,
  "He": 2,
  "Li": 3,
  "Be": 4,
  "B": 5,
  "C": 6,
  "N": 7,
  "O": 8,
  "F": 9,
  "Ne": 10,
  "Na": 11,
  "Mg": 12,
  "Al": 13,
  "Si": 14,
  "P": 15,
  "S": 16,
  "Cl": 17,
  "Ar": 18,
  "K": 19,
  "Ca": 20,
  "Sc": 21,
  "Ti": 22,
  "V": 23,
  "Cr": 24,
  "Mn": 25,
  "Fe": 26,
  "Co": 27,
  "Ni": 28,
  "Cu": 29,
  "Zn": 30,
  "Ga": 31,
  "Ge": 32,
  "As": 33,
  "Se": 34,
  "Br": 35,
  "Kr": 36,
  "Rb": 37,
  "Sr": 38,
  "Y": 39,
  "Zr": 40,
  "Nb": 41,
  "Mo": 42,
  "Tc": 43,
  "Ru": 44,
  "Rh": 45,
  "Pd": 46,
  "Ag": 47,
  "Cd": 48,
  "In": 49,
  "Sn": 50,
  "Sb": 51,
  "Te": 52,
  "I": 53,
  "Xe": 54,
  "Cs": 55,
  "Ba": 56,
  "La": 57,
  "Ce": 58,
  "Pr": 59,
  "Nd": 60,
  "Pm": 61,
  "Sm": 62,
  "Eu": 63,
  "Gd": 64,
  "Tb": 65,
  "Dy": 66,
  "Ho": 67,
  "Er": 68,
  "Tm": 69,
  "Yb": 70,
  "Lu": 71,
  "Hf": 72,
  "Ta": 73,
  "W": 74,
  "Re": 75,
  "Os": 76,
  "Ir": 77,
  "Pt": 78,
  "Au": 79,
  "Hg": 80,
  "Tl": 81,
  "Pb": 82,
  "Bi": 83,
  "Th": 90,
  "Pa": 91,
  "U": 92,
  "Np": 93,
  "Pu": 94,
  "Am": 95,
  "Cm": 96,
  "Bk": 97,
  "Cf": 98,
  "Es": 99,
  "Fm": 100,
  "Md": 101,
  "No": 102,
  "Lr": 103,
  "Rf": 104,
  "Db": 105,
  "Sg": 106,
  "Bh": 107,
  "Hs": 108,
  "Mt": 109,
  "Ds": 110,
  "Rg": 111,
  "Cn": 112,
  "Nh": 113,
  "Fl": 114,
  "Mc": 115,
  "Lv": 116,
  "Ts": 117,
  "Og": 118,
};

class Atom {
  final String symbol;

  Atom(this.symbol) {
    if (!isValidSymbol (symbol)) {
      throw Exception("Invalid atom symbol: $symbol");
    }
  }

  bool isValidSymbol(String symbol) {
    if (elementSymbols.contains(capitalizer(symbol))) {
    return true;
    }
    return false;
  }

  String capitalizer(String input) {
  return input[0].toUpperCase() + input.substring(1).toLowerCase();
}

  @override
  String toString(){
    return capitalizer(symbol);
}
}
class Molecule implements Comparable<Molecule> {
  final String formula;
  final String name;

  Molecule({required String formula, required String name})
      : name = name,
        formula = formula {
    if (isValidFormula(formula) == false) {
      throw Exception("invalid molecular formula");
    }
  }

  List isolatedAtoms(String formula) {
    List<String> splittedForm = formula.split(RegExp(r'(?=[A-Z])'));
    List<String> isolatedAtoms = [];
    for (int i = 0; i < splittedForm.length; i++) {
      List<String> isolatedAtom = splittedForm[i].split(RegExp(r'\d+'));
      isolatedAtoms.addAll(isolatedAtom);
    }
    isolatedAtoms.removeWhere((atom) => atom.isEmpty);
    return isolatedAtoms;
  }

  bool isValidFormula(String formula) {
    bool containsElement = isolatedAtoms(formula).any((atom) => elementSymbols.contains(atom));
    return containsElement;
  }

  bool isDigit(String s) {
  return int.tryParse(s) != null;}

  get weight => molecWeight(formula);

  double molecWeight(String formula) {
  List<String> splittedForm = formula.split(RegExp(r'(?=[A-Z])'));
  double molecWeight = 0.0;

  for (int i = 0; i < splittedForm.length; i++) {
    String symbol = '';
    double count = 1.0;
    for (int j = 0; j < splittedForm[i].length; j++) {
      if (!isDigit(splittedForm[i][j])) {
        symbol += splittedForm[i][j];
      } else {
        count = double.parse(splittedForm[i].substring(j));
        break;
      }
    }
    molecWeight += atomicWeights[symbol]! * count;
  }
  return molecWeight;
}

  double? atomicWeight(String symbol) {
    if (!elementSymbols.contains(symbol)){
      throw Exception("invalid");
    }
    if (elementSymbols.contains(symbol)) {
      return atomicWeights[symbol];
    }
  }


  @override
  String toString(){
    return '$formula';
  }

  @override
  int compareTo(Molecule other) {
    return this.weight.compareTo(other.weight);
  }
  }