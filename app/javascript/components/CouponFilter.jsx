import React from 'react';

export default class CouponFilter extends React.Component{

  handleChange = (e) => {
    e.preventDefault();
    var order = this.props.order == 'desc' ? 'asc' : 'desc';
    this.props.handleCouponFilter(this.props.name, order);
  };

  render = () => {
    var active = this.props.sort == this.props.name;
    var display_name = active ? <u>{this.props.text}</u> : this.props.text;
    var direction;
    if (active) {
      direction = this.props.order == "asc" ? <span className="glyphicon glyphicon-chevron-up" aria-hidden="true"></span> : <span className="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
    }
    return(
      <span onClick={this.handleChange}>
        {display_name}
        {direction}
      </span>
    );
  }
}