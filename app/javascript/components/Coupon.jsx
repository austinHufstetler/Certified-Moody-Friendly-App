import React from 'react';
import PropTypes from 'prop-types';

export default class Coupon extends React.Component {
  static propTypes = {
    title: PropTypes.string,
    description: PropTypes.string,
    image_url: PropTypes.string,
  };

  render = () => {
    return(
      <tr className="spa_entry">
        <td>
          <img src={this.props.coupon.image_url.url} />
        </td>      
        <td>{this.props.coupon.title}</td>
        <td dangerouslySetInnerHTML={{__html: this.props.coupon.description}}></td>   
        <td></td>
        <td></td>  
      </tr>
    )
  }; 

}