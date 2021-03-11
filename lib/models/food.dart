part of 'models.dart';

enum FoodTypes { new_food, popular, recommended }

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodTypes> types;

  Food({
    this.types,
    this.id,
    this.picturePath,
    this.name,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
  });

  @override
  List<Object> get props =>
      [id, picturePath, name, description, ingredients, price, rate];
}

List<Food> mockfoods = [
  Food(
    id: 0,
    picturePath:
        "https://user-images.githubusercontent.com/35651583/108631367-3ce08780-749c-11eb-8b2f-1d94c5cb0883.png",
    name: "Cherry Healthy",
    description: """Makanan khas Bandung yang cukup sering
dipesan oleh anak muda dengan pola makan
yang cukup tinggi dengan mengutamakan
diet yang sehat dan teratur.""",
    ingredients: "Seledri, telur, blueberry, madu.",
    price: 12000,
    rate: 3.6,
    types: [FoodTypes.new_food, FoodTypes.popular, FoodTypes.recommended],
  ),
  Food(
    id: 1,
    picturePath:
        "https://user-images.githubusercontent.com/35651583/108631367-3ce08780-749c-11eb-8b2f-1d94c5cb0883.png",
    name: "Kari Sleman",
    description: """Makanan khas Bandung yang cukup sering
dipesan oleh anak muda dengan pola makan
yang cukup tinggi dengan mengutamakan
diet yang sehat dan teratur.""",
    ingredients: "Seledri, telur, blueberry, madu.",
    price: 12000,
    rate: 3.6,
    types: [FoodTypes.new_food, FoodTypes.recommended],
  ),
  Food(
    id: 2,
    picturePath:
        "https://user-images.githubusercontent.com/35651583/108631367-3ce08780-749c-11eb-8b2f-1d94c5cb0883.png",
    name: "Avosalado",
    description: """Makanan khas Bandung yang cukup sering
dipesan oleh anak muda dengan pola makan
yang cukup tinggi dengan mengutamakan
diet yang sehat dan teratur.""",
    ingredients: "Seledri, telur, blueberry, madu.",
    price: 12000,
    rate: 3.6,
    types: [
      FoodTypes.new_food,
      FoodTypes.popular,
    ],
  ),
  Food(
    id: 3,
    picturePath:
        "https://user-images.githubusercontent.com/35651583/108631367-3ce08780-749c-11eb-8b2f-1d94c5cb0883.png",
    name: "Kopi Kudda",
    description: """Makanan khas Bandung yang cukup sering
dipesan oleh anak muda dengan pola makan
yang cukup tinggi dengan mengutamakan
diet yang sehat dan teratur.""",
    ingredients: "Seledri, telur, blueberry, madu.",
    price: 12000,
    rate: 3.6,
    types: [FoodTypes.new_food, FoodTypes.recommended],
  ),
];
