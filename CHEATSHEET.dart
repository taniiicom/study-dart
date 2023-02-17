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
  type_conv();
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
  var one_point_one = int.parse("1.1");
  assert(one_point_one == 1.1);

  // メソッドver.
  // int -> String
  // ＊dart では, すべてのものはオブジェクト.
  // なので, 数字「1」もそのままでオブジェクトなので, そのままメソッドをつけられる.
  String one_str2 = 1.toString(); // 非破壊的 ^^
  assert(one_str2 == "1");

  // double -> String
  // ^^ こんなこともできちゃう!
  String pi_str = 3.14159.toStringAsFixed(2); // 小数点以下指定
  assert(pi_str == "3.14");

  //
}
