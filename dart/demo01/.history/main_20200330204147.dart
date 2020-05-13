void foo() {} // 顶级函数

class A {
  static void bar() {} // 静态方法
  void baz() {} // 示例方法
}

void main() {
  var x;

  // 比较顶级函数。
  x = foo;
  print(foo == x);

  // 比较静态方法。
  x = A.bar;
  print(A.bar == x);

  // 比较实例方法。
  var v = A(); // A的1号实例
  var w = A(); // A的2号实例
  var y = w;
  x = w.baz;

  // 两个闭包引用的同一实例（2号）,
  // 所以它们相等。
  print(y.baz == x);

  // 两个闭包引用的非同一个实例，
  // 所以它们不相等。
  print(v.baz != w.baz);
}