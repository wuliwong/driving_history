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


## How to run script

From the root directory of this project run:

`ruby lib/driving_history.rb lib/input.txt`

You may substitute `lib/input.txt` for a different file of the expected format.

The script will generate a summary report. It will print to the conosole as well as save the report to:

`output.txt`.


## Project description

The script uses three objects to store and process the input file: `Report`, `Driver` and `Trip`. Separate objects and methods were chosen to make testing and debugging easier as well as provide an intuitive separation of concerns.

A new `Report` is initialzed with an input file. An instance method on a `Report` can then be called to process this input file. This processing creates various instances of `Drivers` and `Trips` according to the information in the input file.

The attribute on a `Report` object named `drivers` is a `Hash`; the key is the `name` of a `Driver` and the value is the corresponding `Driver` object. A `Hash` was chosen so that a `Driver` can quickly be found when a new `Trip` needs to be added.

Each `Driver` has an attribute `trips` which is a simple `Array` of `Trip` objects that the `Driver` took according to the input file. A new `Trip` should be added to the `Driver` by the `add_trip` instance method which updates the `total_distance`, `total_time` and `avg_speed` for the `Driver`. This was chosen so that sorting `drivers` by the total distance they have driven will just require sorting by the `Driver` attribute total_distance, save us from performing on-the-fly calculations of total distance that would require iterating over each `Driver's` `trips` array.

Finally, the method `create_report` can be called on an instance of `Report`. This will print output the console as well as saving the report to the file `output.txt`. The output summarizes the total distance and average speed for each `Driver` with the list sorted by descending total distance.
