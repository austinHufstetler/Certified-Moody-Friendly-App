import React from 'react';
import PropTypes from 'prop-types';

export default class Coupon extends React.Component {
  static propTypes = {
    title: PropTypes.string,
    description: PropTypes.string,
    image_url: PropTypes.string,
    id: PropTypes.string,
    name: PropTypes.string,
    category: PropTypes.string

  };

  handleClick(id) {
    window.location="../coupons/"+id;
  };

  render = () => {
    return(

      <tr className="spa_entry mobi" onClick={() => {this.handleClick(this.props.coupon.id)}}>
        <td className="mobi">
          <img src={this.props.coupon.image_url.url} />
        </td>      
        <td className="mobi">{this.props.coupon.title}</td>
        <td className="mobi" dangerouslySetInnerHTML={{__html: this.props.coupon.description}}></td> 
        <td className="mobi">{this.props.coupon.category}</td>
        <td className="mobi">{this.props.coupon.name}</td> 
      </tr>

    )
  }; 

}