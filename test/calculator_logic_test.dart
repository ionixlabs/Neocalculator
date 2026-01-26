
import 'package:flutter_test/flutter_test.dart';
import 'package:neocalculator/utils/extensions/string_extension.dart';
import 'package:neocalculator/utils/result_model.dart';

void main() {
  group('Calculator Logic Tests', () {
    test('Basic Addition', () {
      expect('2+2'.calculate().output, '4');
    });

    test('Basic Subtraction', () {
      expect('5-3'.calculate().output, '2');
    });

    test('Basic Multiplication', () {
      expect('4x3'.calculate().output, '12');
    });

    test('Basic Division', () {
      expect('10÷2'.calculate().output, '5');
    });

    test('Decimal Calculation', () {
      expect('2.5+2.5'.calculate().output, '5.0');
      expect('2.5+2.6'.calculate().output, '5.1');
    });

    test('Order of Operations', () {
      expect('2+3x4'.calculate().output, '14'); // 2 + 12
      expect('(2+3)x4'.calculate().output, '20'); // 5 * 4
    });

    test('Percentage', () {
      expect('50%'.calculate().output, '0.5');
      expect('100+50%'.calculate().output, '100.5'); // Note: This might be debatable heavily depends on implementation. 
      // In many calculators 100+50% means 100 + (100*0.5). 
      // In this impl: replaceAll('%', '/100') -> 100+50/100 -> 100+0.5 -> 100.5. 
      // So testing the CURRENT implementation.
    });

    test('Division by Zero', () {
      expect('5÷0'.calculate().output, 'Infinity'); 
      // Verify what math_expressions returns. implementation uses RealEvaluator.
    });

    test('Scientific Functions', () {
      expect('sin(0)'.calculate().output, '0');
      expect('cos(0)'.calculate().output, '1');
      expect('tan(0)'.calculate().output, '0');
      expect('log(100)'.calculate().output, '2'); // log base 10 of 100
      expect('ln(e)'.calculate().output, '1');
      expect('sqrt(16)'.calculate().output, '4');
      expect('2^3'.calculate().output, '8');
      expect('π'.calculate().output.substring(0, 4), '3.14');
    });
  });

  group('Expression Validation', () {
    test('Can Calculate', () {
      expect('2+2'.canCalculate, true);
      expect('2+'.canCalculate, false);
      expect('2'.canCalculate, false);
      expect(''.canCalculate, false);
    });

    test('Valid for Calculation', () {
      expect('2+2'.isValidForCalculation, true);
      expect('2+'.isValidForCalculation, false);
    });
  });

  group('Formatting Tests', () {
    test('Format Thousands', () {
      expect('1000'.formatThousands(), '1,000');
      expect('1000000'.formatThousands(), '1,000,000');
      expect('1234.56'.formatThousands(), '1,234.56');
    });

    test('Format Expression', () {
      expect('1000+2000'.formatExpression(), '1,000+2,000');
    });
  });
  
  group('Editing Tests', () {
    test('Remove Last Char', () {
      expect('123'.removeLastChar, '12');
    });
    
    test('Insert Text', () {
        // (String, int) insertText(String value, int offset)
        var result = '123'.insertText('4', 1); // 1|23 -> 14|23
        expect(result.$1, '1423');
        expect(result.$2, 2); // new offset
    });
  });
}
