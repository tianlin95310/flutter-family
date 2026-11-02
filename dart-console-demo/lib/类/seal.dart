// 和 enum 的区别
// enum 的子类型是固定的几个值，每个分支基本不能携带不同的字段结构；sealed class 的每个分支是独立的类，可以有自己的字段、方法、构造函数。

enum StatusS { loading, success, error }   // 只有名字，数据得另外塞

// 换成 sealed 就能把数据绑在类型上
sealed class Status {}
class Loading extends Status {}
class Success extends Status { final int count; Success(this.count); }
class Error extends Status { final Exception e; Error(this.e); }

// 必须在同一文件。这是硬性限制，跨文件继承直接编译错误。想分文件就只能放弃 sealed。
// 不能有工厂/构造函数泄露未知子类型。sealed 类本身不能实例化，但可以在类内部写静态工厂方法返回某个子类，这很常用。
// switch 要写成表达式形式才触发检查。老式的 switch (x) { case ... } 语句在旧版本里不强制穷尽（Dart 3 后语句形式也支持了，但建议统一用 switch (...) { ... } 表达式写法，还能直接返回值）。
// 不想处理某个分支怎么办？显式写 _ => ... 兜底，或者用 case Success() when ... 加守卫条件。一旦写了兜底分支，穷尽性保护就失效了，慎用。
// 和 interface/base 的关系：它们正交。你可以写 sealed interface class Foo（Dart 3 起允许组合修饰符），意思是“封闭 + 只许实现不许继承”，不过日常很少用到。