import 'dart:async';

var books = [
  Books(
      1,
      "Fortress Of Blood",
      "   Mina Murray returns in this suspenseful retelling of a classic tale... Transylvania, 1890 . Mina and her allies have found the Transylvanian countryside dotted with empty villages and whispers of monsters who wear human skin. As Mina prepares for the final showdown with her fiance's abductors, the last descendants of the supernatural Draculesti family... She discovers her own shocking connection to the hidden world of vampires. Start reading now!",
      "Lauren Goffigan",
      "assets_image/one.jpg",
      false,
      false),
  Books(
      2,
      "The Imperfections Of Memory",
      "   In THE IMPERFECTIONS OF MEMORY, a funny and bittersweet new novel, a gifted teen’s future is derailed when she’s diagnosed with a debilitating genetic condition. High school valedictorian Sammie McCoy can’t wait to escape small-town Vermont and start college at NYU.",
      "Angelina Aludo",
      "assets_image/two.jpg",
      false,
      false),
  Books(
      3,
      "The Gravity of Us",
      "   As a successful social media journalist with half a million followers, seventeen-year-old Cal is used to sharing his life online. But when his pilot father is selected for a highly publicized NASA mission to Mars, Cal and his family relocate from Brooklyn to Houston and are thrust into a media circus.Amidst the chaos, Cal meets sensitive and mysterious Leon, another “Astrokid,” and finds himself falling head over heels—fast. As the frenzy around the mission grows, so does their connection. But when secrets about the program are uncovered, Cal must find a way to reveal the truth without hurting the people who have become most important to him.Expertly capturing the thrill of first love and the self-doubt all teens feel, debut author Phil Stamper is a new talent to watch.",
      "Phil Stamper",
      "assets_image/three.jpg",
      false,
      false),
  Books(
      4,
      "The Power of Pivoting",
      "   THE POWER OF PIVOTING is a self-development guide to help you navigate unexpected changes in every area of your life. Relationships, careers, mental health, global crises? Yep, covered! From learning to fear change when we're young, to the First Big Holy Crap (see chapter 2!), this book contains actionable exercises and all the woo-woo goodness to help you turn those unexpected detours, into a life you truly love. From her journey of wanting to be a country singer, to creating the travel show Monica Goes, to the unexpected divorce that rocked her world, Monica uses humor and wisdom to show you how you can lean into your own pivots, even when they suck. This book will help you:· Discover the source of your fear and learn how to let it go. · Build stepping stones towards reaching your goals. · Create your personal mental health toolkit. · Shift your mindset to see setbacks as setups. You'll learn how to create opportunities from any situation, even the unexpected ones, and to trust that the universe has amazing plans for you. Harness the power of pivoting, go forth, and create the life of your dreams! You're a freaking rockstar!",
      "Monica Ortega",
      "assets_image/four.jpg",
      false,
      false),
];

var users = [
  Users(1, "PhamQuang", "phamquang", "quangpham2kst.gmail.com",
      "Phan Dinh Giot - Phuong Liet - Thanh Xuan - Ha Noi")
];
var category = [
  {"id": 1, "name": "Love Story", "isActive": false, "sortOrder": 1},
  {"id": 2, "name": "Horror", "isActive": false, "sortOrder": 2},
  {"id": 3, "name": "School", "isActive": false, "sortOrder": 3},
  {"id": 4, "name": "Politics", "isActive": false, "sortOrder": 4},
];

List<Books> searchBooks(String keyword) {
  return books
      .where((element) =>
          element.name.toLowerCase().contains(keyword) ||
          element.description.toLowerCase().contains(keyword) ||
          element.author.toLowerCase().contains(keyword))
      .toList();
}

Books bookDetail(int id) {
  Books book = books.singleWhere((element) => element.id == id);
  return book;
}

List<Books> bookRelated(int id) {
  return books.where((element) => element.id != id).toList();
}

class Users {
  int id;
  String name;
  String password;
  String email;
  String address;
  Users(this.id, this.name, this.password, this.email, this.address);
}

class Books {
  int id;
  String name;
  String description;
  String author;
  String image;
  bool favorite;
  bool isReadMore;
  Books(this.id, this.name, this.description, this.author, this.image,
      this.favorite, this.isReadMore);
}

class SignInBloc {
  final StreamController _user = StreamController();
  final StreamController _pass = StreamController();

  Stream get userStream => _user.stream;
  Stream get passStream => _pass.stream;

  bool isValid(String user, String pass) {
    if (Validation.isValidUserSignIn(user)) {
      _user.sink.addError("Account empty!");
      return false;
    }
    _user.sink.add("OK");
    if (Validation.isValidPass(pass)) {
      _pass.sink.addError("Password invalid!");
      return false;
    }
    _pass.sink.add("OK");
    return true;
  }

  signIn(String userName, String pass) {
    for (var user in users) {
      if (userName != user.name && pass != user.password) {
        return false;
      } else {
        return true;
      }
    }
  }

  void dispose() {
    _user.close();
    _pass.close();
  }
}

class SignUpBloc {
  final StreamController _user = StreamController();
  final StreamController _pass = StreamController();
  final StreamController _address = StreamController();
  final StreamController _email = StreamController();
  final StreamController _confirm = StreamController();

  Stream get userStream => _user.stream;
  Stream get passStream => _pass.stream;
  Stream get addressStream => _address.stream;
  Stream get emailStream => _email.stream;
  Stream get confirmStream => _confirm.stream;

  bool isValid(
      String user, String pass, String address, String email, String confirm) {
    if (Validation.isAddress(address)) {
      _address.sink.addError("Address is empty or invalid!");
      return false;
    }
    _address.sink.add("OK");
    if (Validation.isEmail(email)) {
      _email.sink.addError("Email invalid!");
      return false;
    }
    _email.sink.add("OK");
    if (Validation.isValidUser(user)) {
      _user.sink.addError("Account empty or exists!");
      return false;
    }
    _user.sink.add("OK");
    if (Validation.isValidPass(pass)) {
      _pass.sink.addError("Password invalid!");
      return false;
    }
    _pass.sink.add("OK");
    if (Validation.isConfirmPassword(pass, confirm)) {
      _confirm.sink.addError("Confirm password incorrect!");
      return false;
    }
    _confirm.sink.add("OK");
    return true;
  }

  void dispose() {
    _address.close();
    _email.close();
    _pass.close();
    _user.close();
    _confirm.close();
  }
}

class Validation {
  static bool isAddress(String address) {
    return address.isEmpty || address.length < 10;
  }

  static bool isConfirmPassword(String pass, String confirm) {
    return pass != confirm;
  }

  static bool isEmail(String email) {
    return email.isEmpty || email.length < 6 || !email.contains("@");
  }

  static bool isValidUser(String userName) {
    for (var user in users) {
      if (user.name == userName) {
        return true;
      }
    }
    return userName.isEmpty || userName.length < 6;
  }

  static bool isValidUserSignIn(String userName) {
    return userName.isEmpty || userName.length < 6;
  }

  static bool isValidPass(String pass) {
    return pass.isEmpty || pass.length < 6;
  }
}
