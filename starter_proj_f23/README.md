
# Fall '23 Software Starter Project

In this project you will be designing an interpreter for a log file. You will create a program that can read through a log file and turn it into a visualization.

## The Project

The project can be broken down into two parts

1.) Creating a processer for a Can ID of the BMS (001) (**Everyone**) and MC  (181) (**Data Analysis Team Only**)

2.) Creating a Battery Diagnostic Test (**Data Analysis Team Only**)

## CAN Log File Syntax

Each log file will be filled with thousands of lines that look like the one below 

```log
(1655497648.413275) can0 281#131EFC030000
```

Each one of these lines is a message from the Can-Bus (computer on the motorcycle)

We can break it down as follows:

- `(1655497648.413275)` is the timestamp that the message was sent at in unix time 
- `can0` = which can bus its coming from (will always be `can0`)
- `281` = the can id in hex (list of can id info can be found below or in ver1.json)
- `#` separator
- `131EFC030000` = bytes of data in hex

So as a template, it looks like

```log
(TIMESTAMP.TIMESTAMP) CAN_BUS_ID CAN_ID#DATA
```
If you need a visual example check this [presentation](https://docs.google.com/presentation/d/1vuFCZWAWuAK6TO_t9x8a3lCeTKKszVeGpRPZ2DuoKA0/edit#slide=id.g23a5cbbb9de_0_0) (slides 14-26)

### Things to note:

Unix Time
- All we care about for the Unix time is that larger number means more recent
Can Bus ID
- CAN_BUS_ID will for this project will always be `can0`
Can ID
- If the can id is `00X` it is a message from the BMS 
- If the can id is `X81` it is a message from the MC
- If the can id is `036` it is for battery diagnostic testing
Data
- If the message is from the BMS, it is Big-Endian
- If the message is from the MC, it is Little-Endian


## How to turn this into code

I have created some starter code for you all to use in Python.

If you do not know how to use python or need a refresher for syntax check this [presentation](https://docs.google.com/presentation/d/1vuFCZWAWuAK6TO_t9x8a3lCeTKKszVeGpRPZ2DuoKA0/edit#slide=id.g23a5cbbb9de_0_0) (slides 27-32)

The starter code provided is broken into four functions (two for each part)

**Part 1: Visualizer/Processor**

In this part we will be creating a log file processer 

In processor() we will need to:
-  Read in the "rules" of each message which are stored in a json file in ver1.json
- Parse through each line of our log file and seperate each component
- Output a DataFrame type object ([documentation](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.html)) storing the desired information

In grapher() we will need to:
- Create a Plotly graph with this data we just processed ([presentation/documentation for Plotly](https://docs.google.com/presentation/d/1vuFCZWAWuAK6TO_t9x8a3lCeTKKszVeGpRPZ2DuoKA0/edit#slide=id.g23a5cbbb9de_0_0) slides 36-end)

**Part 2: Battery Diagnostic (Data Analysis Team Only)**

In this part we will be making a visualization of a Battery Diagnostic test

We can reuse some of the code from Part 1, but we have to make some serious modifications
Can ID 036 is used for all Battery Diagnostic Info

Each line of the logfile containing this Can ID shares info on 16 different batteries cells

Each cell is differentiated by the first byte of the content being a battery_id (byte[0])

**\*\*\*This is different from before as each battery_id has data that is not related to the other battery ids*****

We have to keep track of the data and which battery_id it belongs to

For our graph we will then seperate each batter_id into its own "trace" in plotly

In other words, each battery_id should be its own line on the graph (there should be around 16 battery ids total)
For roughly what the graph should look like, check the 
Part2_Example.png

In battery_processer() we will need to:

- Parse through each line of our log file and seperate each component
- Output a DataFrame type object ([documentation](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.html)) storing the desired information

In grapher() we will need to:
- Create a Plotly graph with this data we just processed ([presentation/documentation for Plotly](https://docs.google.com/presentation/d/1vuFCZWAWuAK6TO_t9x8a3lCeTKKszVeGpRPZ2DuoKA0/edit#slide=id.g23a5cbbb9de_0_0) slides 36-end)


## Can Data "Rules"

Each table below represents a different Can ID and how their respective data can be broken down into bytes

#### What does each column mean?

1.) Name of the element we want

2.) Scaling is the value we multiply the procesed value by (ex. we get a value from Pack Current to be 28, we would then multiply it by 0.1)

3.) Signed means are the bytes signed or does it follow [2s complement](https://en.wikipedia.org/wiki/Two%27s_complement)

4.) Bytes means which bytes to take from the data, each data section is in hex so every two characters in hex is a byte of information. In the case were the element has multiple bytes, we have to remember about endianess mentioned previously.



| CAN ID: 181 | Scaling | Signed | Bytes |
|-------------|---------|--------|-------|
| Status Word | 1.0     | No     | 0 1 |
| Velocity    | 1.0     | No     | 2 3 4 5 6 |

| CAN ID: 001          | Scaling | Signed | Bytes |
|----------------------|---------|--------|-------|
| Pack Current         | 0.1     | Yes    | 0 1   |
| Pack Instant Voltage | 0.1     | No     | 2 3   |
| Failsafe Status      | 1       | No     | 4 5   |
| High Temp            | 1       | Yes    | 6     |
| Low Temp             | 1       | Yes    | 7     |

| CAN ID: 036         | Scaling | Signed | Bytes |
|---------------------|---------|--------|-------|
| ID                  | 1.0     | No     | 0     |
| Instant Voltage     | 1.0     | No     | 1 2   |
| Internal Resistance | 1.0     | No     | 3 4   |
| Open Voltage        | 1.0     | No     | 5 6   |
| Checksum            | 1.0     | No     | 7     |