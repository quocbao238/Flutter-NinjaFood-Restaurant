part of core_widget;

class AppScaffoldBackgroundImage extends AppScaffold {
  const AppScaffoldBackgroundImage({super.key, required super.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_image.png'),
              fit: BoxFit.cover)),
      child: body,
    ));
  }
}
