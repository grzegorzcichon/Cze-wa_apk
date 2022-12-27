import 'package:czestochowa_app/resources/colors/colors.dart';
import 'package:czestochowa_app/widgets/appbars/appbars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/strings/strings.dart';
import '../../../widgets/text_styles.dart';
import '../cubit/enums.dart';
import '../cubit/weather_cubit.dart';
import '../model/weather_model.dart';
import '../repository/weather_repository.dart';

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(
        WeatherRepository(),
      ),
      child: BlocListener<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            final weatherModel = state.model;
            return Scaffold(
              appBar: CustomAppbarWeatherScreen(),
              body: Center(
                child: Builder(builder: (context) {
                  if (state.status == Status.loading) {
                    return const Text('Loading');
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (weatherModel != null)
                        _DisplayWeatherWidget(
                          weatherModel: weatherModel,
                        ),
                      _SearchWidget(),
                    ],
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DisplayWeatherWidget extends StatelessWidget {
  const _DisplayWeatherWidget({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Text(
                    Str.label.city,
                    style: TextStyles.overline(
                        color: Theme.of(context).colorScheme.fontblacktext,
                        context: context),
                  ),
                  Text(weatherModel.city,
                      style: TextStyles.overline(
                          color: Theme.of(context).colorScheme.fontblacktext,
                          context: context)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Text(
                      Str.label.temperature,
                      textAlign: TextAlign.right,
                      style: TextStyles.overline(
                          color: Theme.of(context).colorScheme.fontblacktext,
                          context: context),
                    ),
                    Text(
                      ' ${weatherModel.temperature.toString()}${' °C'}',
                      style: TextStyles.overline(
                          color: Theme.of(context).colorScheme.fontblacktext,
                          context: context),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      Str.label.wind,
                      style: TextStyles.overline(
                          color: Theme.of(context).colorScheme.fontblacktext,
                          context: context),
                    ),
                    Text(' ${weatherModel.wind.toString()}${' km/h'}',
                        style: TextStyles.overline(
                            color: Theme.of(context).colorScheme.fontblacktext,
                            context: context)),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    Str.label.winddir,
                    style: TextStyles.overline(
                        color: Theme.of(context).colorScheme.fontblacktext,
                        context: context),
                  ),
                  Text(weatherModel.winddir,
                      style: TextStyles.overline(
                          color: Theme.of(context).colorScheme.fontblacktext,
                          context: context)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      Str.label.pressure,
                      style: TextStyles.overline(
                          color: Theme.of(context).colorScheme.fontblacktext,
                          context: context),
                    ),
                    Text(' ${weatherModel.pressure}${' hPa'}',
                        style: TextStyles.overline(
                            color: Theme.of(context).colorScheme.fontblacktext,
                            context: context)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      Str.label.pm25,
                      style: TextStyles.overline(
                          color: Theme.of(context).colorScheme.fontblacktext,
                          context: context),
                    ),
                    Text(
                        double.parse((weatherModel.pm25.toString()))
                            .toStringAsFixed(3),
                        style: TextStyles.overline(
                            color: Theme.of(context).colorScheme.fontblacktext,
                            context: context)),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    Str.label.PM10,
                    style: TextStyles.overline(
                        color: Theme.of(context).colorScheme.fontblacktext,
                        context: context),
                  ),
                  Text(
                      double.parse((weatherModel.pm10.toString()))
                          .toStringAsFixed(3),
                      style: TextStyles.overline(
                          color: Theme.of(context).colorScheme.fontblacktext,
                          context: context)),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    Str.label.co,
                    style: TextStyles.overline(
                        color: Theme.of(context).colorScheme.fontblacktext,
                        context: context),
                  ),
                  Text(
                      double.parse((weatherModel.co.toString()))
                          .toStringAsFixed(3),
                      style: TextStyles.overline(
                          color: Theme.of(context).colorScheme.fontblacktext,
                          context: context)),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    Str.label.time,
                    style: TextStyles.overline(
                        color: Theme.of(context).colorScheme.fontblacktext,
                        context: context),
                  ),
                  Text(weatherModel.localtime,
                      style: TextStyles.overline(
                          color: Theme.of(context).colorScheme.fontblacktext,
                          context: context)),
                ],
              ),
              const SizedBox(height: 60),
            ],
          ),
        );
      },
    );
  }
}

class _SearchWidget extends StatelessWidget {
  _SearchWidget({
    Key? key,
  }) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Miasto'),
              ),
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              context
                  .read<WeatherCubit>()
                  .getWeatherModel(city: _controller.text);
            },
            child: Text(Str.buttons.getweather,
                style: TextStyles.overline(
                    color: Theme.of(context).colorScheme.fontblacktext,
                    context: context)),
          ),
        ],
      ),
    );
  }
}
