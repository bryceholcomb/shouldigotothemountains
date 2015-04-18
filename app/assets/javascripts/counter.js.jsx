var App = React.createClass({
  render: function() {
    return (
      <div>
        <h1>Hello, {this.props.name}</h1>
        <h3>Clicks: {this.state.count}</h3>
        <button type='button' onClick={this.incrementCount}>Click Me!</button>
      </div>
    )
  },

  getInitialState: function (){
    return { count: 0 };
  },

  incrementCount: function() {
    this.setState({
      count: this.state.count + 1
    });
  },
});

var ready = function () {
  // React.render(
  //   <App name='Bryce'/>, document.getElementById('example')
  // );
};

$(document).ready(ready);







