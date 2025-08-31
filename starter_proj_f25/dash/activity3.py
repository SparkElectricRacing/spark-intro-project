import dash
from dash import html, Input, Output, dcc

app = dash.Dash(__name__)

app.layout = html.Div([
    html.H1("Button Click Counter"),
    html.Button("Click Me!", id="my-button", n_clicks=0),
    # TODO: Add another button that subtracts number of clicks
    html.Div(id="button-counter")
])


# TAKE NOTE OF WHAT THE INPUT AND OUTPUTS ARE HERE
@app.callback(
    Output("button-counter", "children"),
    Input("my-button", "n_clicks")
)
def update_output(clicks: int):
    """Counts number of times button was pressed.

    Args:
        clicks (int): Number of times button has been pressed.

    Returns:
        str: Generates a string that goes to the output  
    """
    return "CHANGE ME" # TODO


if __name__ == "__main__":
    app.run_server(debug=True)
