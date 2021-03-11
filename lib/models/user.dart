part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.picturePath});

  @override
  List<Object> get props =>
      [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
}

User mockUser = User(
  id: 0,
  name: "fauziarda",
  email: "fauziarda@gmail.com",
  address: "Jl simprug III ",
  houseNumber: "26",
  phoneNumber: "082210714854",
  city: "Jakarta",
  picturePath:
      "https://user-images.githubusercontent.com/35651583/108621136-6a5d0f00-7463-11eb-95bd-73a8ca1eda73.png",
);
