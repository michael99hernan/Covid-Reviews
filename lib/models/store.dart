class Store {
  String id;
  String name;
  String address;
  double avgRating;

  Store({this.id, this.name, this.address, this.avgRating});

  String toString() {
    String text;
    text = 'id: ' +
        this.id +
        ' name: ' +
        this.name +
        ' address: ' +
        this.address +
        ' avgRating: ' +
        avgRating.toString();
    return text;
  }
}
