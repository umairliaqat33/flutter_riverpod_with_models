import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_with_models/service.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyHomePage(title: "Riverpod model example"),
    ),
  );
}

/// final servicesProvider = StateNotifierProvider<ServiceProviders, User>(
///   (ref) => ServiceProviders(
///     User(name: "Umair", age: 22),
///   ),
/// );

/// another type of providers is ChangeNotifier provider. Only difference with others is that it is mutable, while others are
/// immutable
final serviceChangeNotifier =
    ChangeNotifierProvider((ref) => ServiceChangeNotifier());

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, this.title});

  final String? title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  void _incrementCounter(String n, int a) {
    ref.read(serviceChangeNotifier).update(n, a);
  }

  @override
  Widget build(BuildContext context) {
    // //it reloads the whole screen when any of the properties of user changes.
    /// final user = ref.watch(servicesProvider);
    //this reloads whole screen only when name property changes.
    ///final singleEntityChanger = ref.watch(servicesProvider.select(
    ///   (value) => value.name,
    /// ));

    final user = ref.watch(serviceChangeNotifier).user;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(user.name),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello i am ${user.name}',
              ),
              Text(
                '${user.age}',
                style: Theme.of(context).textTheme.headline4,
              ),
              TextField(
                controller: nameController,
              ),
              TextField(
                controller: ageController,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _incrementCounter(
            nameController.text,
            int.parse(ageController.text),
          ),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
