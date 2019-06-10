## Driving Summary Calculator

The script `lib/driving_history.rb` accepts an input file of the format

```
Driver Dan
Driver Alex
Driver Bob
Trip Dan 07:15 07:45 17.3
Trip Dan 06:12 06:32 21.8
Trip Alex 12:01 13:16 42.0
```

and prints an output summary of the format

```
Alex: 42 miles @ 34 mph
Dan: 39 miles @ 47 mph
Bob: 0 miles
```

The script uses three objects to store and process the input file.

`Report`, `Driver` and `Trip`.

A new `Report` is initialzed with an input file. An instance method on the `report` can then be called to process this input file. This processing creates various instances of `Drivers` and `Trips` according to the information in the input file.

The attribute on a `Rerport` object named `drivers` is a `Hash`; the keys are the `name` of a `Driver` and the values are the corresponding `Driver` object. A `Hash` was chosen so that a `Driver` can quickly be found when a new `Trip` needs to be added. 

Each `Driver` has an attribute `trips` which is a simple `Array` of `Trip` objects that the `Driver` took according to the input file. A new `Trip` should be added to the `Driver` by the `add_trip` instance method which updates the `total_distance`, `total_time` and `avg_speed` for the `Driver`. This was chosen so that sorting `drivers` by the total distance they have driven will just require sorting by an attribute value, not requiring on-the-fly calculations of distance from `trips'.

Finally, the method `create_report` can be called on an instance of `Report`. This will generate output displaying the total distance and average speed for each Driver with the list sorted by descending total distance.
