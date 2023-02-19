/*
  ＊静的型: あとから, 型変更できない. 
  ex. dynamic型は例外
*/

/*
  ＊コンパイルには2種類ある
  AOT と JIT
*/

// import
// dart:core
import "dart:core"; // 省略可. これは自動でimportされる.
import "dart:io"; // ユーザからの入力 ライブラリ

// void: 戻り値なし
void main() {
  // printing();
  // inout();
  // type_conv();
  // constant();
  // nullaware();
  // ternary_ope();
  // type_test();
  // if_elseif_else();
  switching();
}

// f: 変数とプリント
/*
  ＊変数型一覧
  int double String bool
  dynamic: 可変
  ex. var: 明示的に定義しない
*/
void printing() {
  var firstName = "Tomohiro"; // コンパイラが推測
  String lastName = "Tani"; // 明示的に定義

  print(firstName + " " + lastName);
}

// f: 標準入出力
void inout() {
  stdout.writeln("What is your name: ?");
  String? name = stdin.readLineSync();
  // 変数展開
  print("My name is $name");
}

// f: 型変換
void type_conv() {
  // 関数ver.
  // String -> int
  String one_str = "1";
  var one = int.parse(one_str);
  // assert(): 括弧内が True でないとき, WARNING を発生させる ^^
  assert(one == 1);

  // String -> double
  var one_point_one = double.parse("1.1");
  assert(one_point_one == 1.1);

  // メソッドver.
  // int -> String
  // ＊dart では, すべてのものはオブジェクト.
  // なので, 数字「1」もそのままでオブジェクトなので, そのままメソッドをつけられる.
  String one_str2 = 1.toString(); // 非破壊的 ^^
  assert(one_str2 == "1");

  // double -> String
  // ^^ こんなこともできちゃう!
  String pi_str = 3.14159.toStringAsFixed(2); // 小数点以下指定桁数(四捨五入)
  assert(pi_str == "3.14");
}

// f: 定数
void constant() {
  const int a_const_num = 0;
  const bool a_const_bool = true;
  const String a_const_str = "Hello World";

  print(a_const_num);
  print(a_const_bool);
  print(a_const_str);

  print(a_const_num.runtimeType);
  print(a_const_bool.runtimeType);
  print(a_const_str.runtimeType);
}

// f: 演算子
/*
＊一般的な演算子が利用可能
- (+ - * / %)
- (== != >= <=) relational
- (+= -= *= /=)
- (++var var++) unary operator
- (&& ||) logical operator
*/
/*
＊モダンな演算子! ^^
- (?. ?? ??=) null aware operator
  cf. swift, kotlin などに存在
*/
class Num {
  int num = 10;
}

// f: Null Aware Operator
// nullaware:
// もし, オブジェクト自体が存在しなかった場合,
// オブジェクト自体の参照に対しては null が返却されるが,
// オブジェクト.属性 などは, エラーになる!
// それを回避する機構が, nullaware! ^^
void nullaware() {
  var inst = Num(); // Dart ではインスタンス生成はこれで OK ( Python と同じ)
  // ! number には, nullaware によって, null が代入される場合があるので,
  // int? にしないといけない! ^^
  int? number;

  // ~ legacy
  if (inst != null) {
    number = inst.num;
  }
  // ~

  // ~ modern
  number = inst?.num;
  // ~

  // cf. null の代わりに, default 値を代入する
  number = inst?.num ?? 0;

  // cf. null の場合に, 代入 -> 返却
  int? number2;
  print(number2 ??= 2434);
  print(number2);
}

// f: 三項演算子
// PHP に近い書き方 ^^
void ternary_ope() {
  int x = 100;
  var res = x % 2 == 0 ? "even" : "odd";
  print(res);
}

// f: Type Test
void type_test() {
  var x = 100;

  // is: 型をチェック
  if (x is int) {
    print("int");
  }
}

// f: if elseif else
// else if と書く!
void if_elseif_else() {
  var x = 100;

  if (x is int) {
    print("int");
  } else if (x is double) {
    print("double");
  } else {
    print("not a number");
  }
}

// f: switch 文
void switching() {
  int i = 0;

  switch (i) {
    case 0:
      print("int");
      break; // 忘れない!
    case 1:
      print("double");
      break; // 忘れない!
    default:
      print("not a number");
  }
}

// 
