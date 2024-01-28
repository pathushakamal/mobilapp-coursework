// class CategoryService {
// Future<List<String>> fetchCategories() async {
// return [
// 'Business',
// 'Entertainment',
// 'General',
// 'Health',
// 'Science',
// 'Sports',
// 'Technology',
// ];
// }
// }

class CategoryService {
  List<Category> fetchCategories() {
    return [
      Category(
          name: 'Business',
          imageUrl: 'https://etimg.etb2bimg.com/photo/88290944.cms'),
      Category(
          name: 'Entertainment',
          imageUrl:
              'https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg'),
      Category(
          name: 'General',
          imageUrl:
              'https://www.albertadoctors.org/images/ama-master/feature/Stock%20photos/News.jpg'),
      Category(
          name: 'Health',
          imageUrl:
              'https://cms-api-in.myhealthcare.co/image/20220910103120.jpeg'),
      Category(
          name: 'Science',
          imageUrl:
              'https://www.science.edu/acellus/wp-content/uploads/2017/01/Science-2-712x388-712x388.jpg'),
      Category(
          name: 'Sports',
          imageUrl:
              'https://www.timeshighereducation.com/student/sites/default/files/styles/default/public/different_sports.jpg'),
      Category(
          name: 'Technology',
          imageUrl:
              'https://transcosmos.co.uk/wp-content/uploads/2015/10/technology-customer-support1-2000x1200.jpg'),
    ];
  }
}

class Category {
  final String name;
  final String imageUrl;

  Category({required this.name, required this.imageUrl});
}
