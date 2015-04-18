var Reports = React.createClass({
  getInitialState: function() {
    return {reports: []}
  },

  componentWillMount: function() {
    this._grabReportsData();
  },

  render: function() {
    if (this.state.reports[0]) {
      var lastUpdate = this.state.reports[0].report_date;
    }

    return (
      <span>
        <p className="link" onClick={this._toggleReports}>check the reports</p>
        <div id="report_list">
            {
               this.state.reports.map(function(report) {
                return (<p className='report'>{ report.mountain }, {report.yesterday_snow_total} inches</p> );
              })
            }
          <p className='report'> last update: { lastUpdate } </p>
        </div>
      </span>
    );
  },

  _toggleReports: function() {
    var reportList = document.getElementById("report_list");

    $(reportList).toggle();
  },

  _grabReportsData: function() {
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
