import 'package:convenience_types/errors/errors.dart';
import 'package:convenience_types/types/form_field.dart' as form;
import 'package:convenience_types/types/maybe.dart';
import 'package:convenience_types/types/request_status.dart';
import 'package:convenience_types/types/result.dart';
import 'package:dio/dio.dart';
import 'package:example/http_client_wrapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Convenience Types Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  form.FormField<String> numberField = const form.FormField(name: 'number');
  RequestStatus<Number> numberRequestStatus = const Idle();
  Dio client = Dio(BaseOptions(
      baseUrl: 'http://numbersapi.com/',
      contentType: 'application/json; charset=utf-8'));
  late HttpClientWrapper clientWrapper;

  @override
  void initState() {
    super.initState();
    clientWrapper = HttpClientWrapper(client);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Enter a number to search for a trivia:',
              ),
              TextField(
                onChanged: _onFieldChanged,
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: _onButtonPressed,
                child: const Text('Search'),
              ),
              const SizedBox(
                height: 8,
              ),
              numberRequestStatus.when(
                idle: () => const SizedBox(),
                loading: () => const LinearProgressIndicator(),
                succeeded: (data) => Text(
                    'You\'ve just searched ${data.number}, here is a trivia for it: ${data.text}!'),
                failed: (error) => Text(
                    'Something didn\'t go well! Sorry! hint: ${error.slug}'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onFieldChanged(String value) {
    numberField = numberField.copyWith(field: Just(value));
  }

  void _onButtonPressed() async {
    setState(() {
      numberRequestStatus = const Loading();
    });

    Result<Number> numberRes;

    try {
      numberRes = (await clientWrapper.get(
              url: '${numberField.field.getOrElse('')}?json'))
          .mapSuccess(_mapRequestToNumber);
    } catch (e) {
      numberRes = Failure(
        AppUnknownError(
          slug: e.toString(),
        ),
      );
    }

    setState(() {
      numberRequestStatus = RequestStatus.fromResult(numberRes);
    });
  }

  Result<Number> _mapRequestToNumber(data) {
    try {
      return Success(Number.fromJson(data));
    } catch (e) {
      return Failure(HttpUnknownError(slug: e.toString()));
    }
  }
}

class Number {
  final String text;
  final int number;
  final String type;

  Number(
    this.text,
    this.number,
    this.type,
  );

  factory Number.fromJson(Map<String, dynamic> json) {
    try {
      return Number(
        json['text']!,
        json['number']!,
        json['type']!,
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
