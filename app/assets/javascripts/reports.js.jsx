var Reports = React.createClass({
  getInitialState: function() {
    return {reports: []}
  },

  componentWillMount: function() {
    this._makeAjaxCallForData();
  },

  render: function() {
    return (
      <span>
        <p class="link" onClick={this._toggleReports}>check the reports</p>

        <div id="report_list">
          { this.state.reports.map(function(report) {
            return (
              <p>{ report.mountain }, {report.yesterday_snow_total} inches</p>
            );
          })}
        </div>
      </span>
    );
  },

  _toggleReports: function() {
    var thing = document.getElementById("report_list");

    $(thing).toggle();
  },

  _makeAjaxCallForData: function() {
    $.ajax({
      url: this.props.url,
      success: function(reports) {
        this.setState({reports: reports});
      }.bind(this),
      error: function (xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  }
});

var doIt = function () {
  React.render(
    <Reports url='/index.json'/>, document.getElementById('reports')
  );
};

$(document).ready(doIt);
