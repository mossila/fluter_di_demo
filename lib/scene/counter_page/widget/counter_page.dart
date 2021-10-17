import 'package:di_demo/model/sale_data.dart';
import 'package:di_demo/scene/counter_page/bloc/count_change_bloc.dart';
import 'package:di_demo/scene/counter_page/bloc/sale_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var counterBloc = Provider.of<CounterBloc>(context);
    var saleBloc = Provider.of<SaleBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App 💉'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
              stream: counterBloc.counterStream,
              initialData: counterBloc.value,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            StreamBuilder(
              stream: saleBloc.getResponse,
              builder: (BuildContext context,
                  AsyncSnapshot<List<SaleData>> snapshot) {
                return Container(
                  child: SfCircularChart(
                    title: ChartTitle(text: "Sale of year"),
                    legend: Legend(
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap),
                    tooltipBehavior: _tooltipBehavior,
                    series: <DoughnutSeries<SaleData, String>>[
                      DoughnutSeries(
                          dataSource: snapshot.data,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true),
                          enableTooltip: true,
                          dataLabelMapper: (SaleData data, _) => data.year,
                          xValueMapper: (SaleData data, _) => data.year,
                          yValueMapper: (SaleData data, _) => data.sales)
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counterBloc.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
