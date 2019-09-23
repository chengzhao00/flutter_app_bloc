


class BaseEntity<T> {

  T data;

  int errorCode;


  String errorMsg;

  BaseEntity({this.data, this.errorCode, this.errorMsg});

  factory BaseEntity.fromJson(Map<String,dynamic> json){
    int errorCode = json['errorCode'];
    String msg = json['errorMsg'];
    T data = json['data'];
    return BaseEntity(data: data,errorMsg: msg,errorCode: errorCode);
  }


  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map();
//    if(this.data != null){
//      data['data'] = this.data.toJson()
//    }
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }


}