import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // We dont add scaffold here. The reason for that is that now the favoritesScreen still kind of is like a screen, it still occupies the majority of our page but it doesn't manage the entire page. Of course, we still have our tabs in the appBar of the TabsScreen up there. So the content we load into a tab should now not bring its own scaffold because it will not control the entire page, instead it will be a part of the TabsScreen, the favoritesScreen is now only controlling that bottom part. So for the categories screen, you should now also get rid of the scaffold here and just return what you want to show in the content.
    return Center(
      child: Text('The Favorites'),
    );
  }
}
