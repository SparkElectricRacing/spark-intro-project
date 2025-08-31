
# Learning Spec: Python Dash Essentials

## Foundations

### What is Dash?

- High-level framework for building interactive web apps in Python.

- Built on Flask, Plotly.js, and React.js.

- Use cases: dashboards, data visualization apps, lightweight interactive UIs.

### Useful Pre-Req Skills 

- Basic Python (functions, variables, lists, dicts).

- Familiarity with Pandas (optional but very useful).

- Awareness of web concepts (HTML/CSS, client-server basics).

## Environment Setup

### Create Virtual Enviornment

Python Virtual Enviornments help seperate different dependencies into individual projects

To create a virtual enviornment (only run this once)

```bash
python -m venv env
```

To enter a virtual enviornment (run this every time)

```bash
source env/bin/activate
```


### Install:

Install necessary libraries

```bash
pip install dash plotly pandas
```

### Create a app.py file.

Run app with:

```bash
python app.py
```

### Access in browser

In your browser of choice go to http://127.0.0.1:8050

## Activity 1 (Components):

### Dash Components

- HTML components (dash.html)
    - Basic building blocks: Div, H1, P, Img, A.

- Core components (dash.dcc)

- Interactive widgets: Graph, Dropdown, Slider, Input, Checklist.

- Nesting components inside layout.

### Example

Below is a very basic example that prints "Hello, Dash!"

```python
import dash
from dash import html

app = dash.Dash(__name__)

app.layout = html.Div("Hello, Dash!")

if __name__ == "__main__":
    app.run_server(debug=True)
```

Try running the code by running `python3 activity1.py` in your terminal

### Concepts:

- dash.Dash() creates app instance.

- app.layout defines UI using components.

- .run_server() launches development server.

### Task 1:

To complete acitivity 1 you must have each of the following inside of a div as children:

- A p element with the text "I love spark!"
- An img element displaying the Spark logo


## Activity 2 (Styling):

### Styling

#### Inline style dicts:

Below is an example of editing the style or way the elements look IN THE PYTHON FilE ITSELF

```python
html.Div("Text", style={"color": "blue", "fontSize": 20})
```

- External CSS: linking stylesheets.
- Layout patterns: Rows/Columns with html.Div.

#### External style:

Below is an example of editing the style or way the elements look with an EXTERNAL CSS FILE

```python
external_stylesheets = [
    "style.css"
]

app = dash.Dash(__name__, external_stylesheets=external_stylesheets)
```

### Example

See activity2.py

### Concepts

- style={} is a dash specific syntax to give inline styling for css, see dash's documentation for specifics
- external style sheet links UI to a seperate css file (good for large projects, like what we do)
- internal style sheet allows you to quickly edit the way a specific element looks (good for something small)

### Task 2:

To complete Activity 2 you must style the following:

- "Hello Dash" should become red and bold
- The image should be height 100px by width 100px
- The P element should have text color white with background color of black 



## Activity 3 (Interactivity):

### Callback functions

Callback functions are a way of making Dash apps interactive and not just a static webpage.

(Almost) Every call back function has an input and output. What this means is that we are attaching an action of a Dash element (click, hover, etc.) to the input of a call back function. When the action happens the function is called. 

After the function is called the logic will go through and what the function returns will influence the output element.

Example:

```python
from dash import Input, Output, dcc

app.layout = html.Div([
    dcc.Input(id="my-input", value="Dash", type="text"),
    html.Div(id="my-output")
])

@app.callback(
    Output("my-output", "children"),
    Input("my-input", "value")
)
def update_output(value):
    return f"You typed: {value}"
```

Above we have a text input field. When you type a new character, it will call the function and output into the div.


### Concepts

- @app.callback is a dash specific decorator to turn a generic python function into a callback function
- Input(<element-id>, <element-feature>) links function's input to element with specified id and input of the element's feature (children, value, text, etc.)
- Output(<element-id>, <element-feature>) links function output to element with specified id and output into the element's feature (children, value, text, etc.)

### Task 3:

To complete Activity 3 you must do the following:

- When you press the existing button, the text increments how many times the button has been pressed. 
- Create a second button that decrements the counter
