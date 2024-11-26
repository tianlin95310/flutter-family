import 'dart:convert';
import 'dart:core';

//String asf = "{"title":"动账通知","description":"同行转账提交成功","imgUrl":"00ab97d5795c80465e4b71e8b5","fileId":"00ab97d5795c80465e4b71e8b598e7dc","type":"2","content":"消息详情", "subject":"同行转账","currency":"币种：【USD】", "account":"金额：【10000000】", "receiveAccount":"收款账户：尾号【9876】", "submitDate":"提交时间：【2019-09-18】","status":"转账状态：转账中","remarks":"备注：【收到10个亿】","view":"点击查看详情", "url":"www.163.com"}";
void main() {
  Map map = Map();
  Map user = Map();
  user['username'] = 'tianlin';
  user['gender'] = 'male';
  user['id'] = '10001';
  user['socket'] = null;
  map['what'] = 1;
  map['content'] = user;
  print('---json---' + jsonEncode(map));
}


map(){
  String json = '{"name": "123"}';
  print('---json---' + json);
  var map = jsonDecode(json);
  print(map.runtimeType);
  print(map['name']);
}
