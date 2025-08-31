import dash
from dash import html

app = dash.Dash(__name__)

app.layout = html.Div(
    children=[
        html.H1(
            "Hello, Dash!",
            style={
               # TODO
            }
        ),
        html.Img(
            src="https://upload.wikimedia.org/wikipedia/commons/3/37/Plotly_logo.png",
            style={
                # TODO
            }
        ),
        html.P(
            "This is a simple Dash app with inline styling and an image.",
            style={
                # TODO
            }
        )
    ]
)

if __name__ == "__main__":
    app.run_server(debug=True)
