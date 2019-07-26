class PoDetailedINfo {
  String vendor;
  String rec;
  String recdate;
  String term;
  String due;
  String currency;
  String exrate;
  String taxno;
  String taxdate;
  String dono;
  String dodate;
  String location;
  bool comply;
  bool complete;
  bool ontime;
  bool excellent;
  String remark;
  List<MatInfo> list;
  PoDetailedINfo(this.vendor, this.rec, this.recdate, this.term, this.due, this.currency, this.exrate, this.taxno, this.taxdate, this.dono, this.dodate, this.location, this.comply, this.complete, this.ontime, this.excellent, this.remark, this.list);
}

class MatInfo {
  String no;
  String name;
  String poqty;
  String recqty;
  String balqty;
  MatInfo(this.no, this.name, this.poqty, this.recqty, this.balqty);
}