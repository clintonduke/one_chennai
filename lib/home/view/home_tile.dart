import 'package:chennai_demo/utils/utils.dart';

class HomeTile extends StatelessWidget {
  final HomeModel home;

  const HomeTile({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        leading: Image.network(
          home.thumbnail,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(home.title),
        subtitle: Text("₹${home.price}"),
      ),
    );
  }
}
