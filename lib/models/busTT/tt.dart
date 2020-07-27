import 'package:iiitdmjcompanion/components/bus_schedule.dart';
import 'package:iiitdmjcompanion/models/class/class.dart';

import 'busTT.dart';

List<BusTT> tt = [
  for (var i = 0; i < 7; i++)
    for (var j = 0; j < busRoute.length - 1; j++)
      BusTT(
        toFrom: busRoute[i][j],
        day: i == 0
            ? Day.Monday
            : i == 1
                ? Day.Tuesday
                : i == 2
                    ? Day.Wednesday
                    : i == 3
                        ? Day.Thursday
                        : i == 4
                            ? Day.Friday
                            : i == 5 ? Day.Saturday : Day.Sunday,
        time: busTime[i][j],
      )
];

List<List<BusTT>> tt2 = [
  for (var i = 0; i <= 6; i++)
    [
      for (var j = 0; j < busRoute.length - 1; j++)
        BusTT(
          toFrom: busRoute[i][j],
          day: i == 0
              ? Day.Monday
              : i == 1
                  ? Day.Tuesday
                  : i == 2
                      ? Day.Wednesday
                      : i == 3
                          ? Day.Thursday
                          : i == 4
                              ? Day.Friday
                              : i == 5
                                  ? Day.Saturday
                                  : i == 6 ? Day.Sunday : null,
          time: busTime[i][j],
        )
    ]
];
