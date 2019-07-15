import 'models/user_model.dart';

List<UserModel> getData() {
  List<UserModel> listItems = [];
  listItems.add(new UserModel(
      name: 'Yaroslav',
      distance: '12Km',
      reviews: '12 reviews',
      price: '300kr'));
  listItems.add(new UserModel(
      name: 'Vetle', distance: '10Km', reviews: '5 reviews', price: '200kr'));
  listItems.add(new UserModel(
      name: 'Stone', distance: '1Km', reviews: '15 reviews', price: '500kr'));
  listItems.add(new UserModel(
      name: 'Tim', distance: '1.5Km', reviews: '10 reviews', price: '300kr'));
  return listItems;
}
