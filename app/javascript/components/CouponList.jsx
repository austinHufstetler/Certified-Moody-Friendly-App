import React from 'react';
import Coupon from './Coupon';

export default class CouponList extends React.Component {
  render = () => {
    var coupons = [];

    this.props.coupons.forEach(function(coupon) {
      coupons.push(<Coupon coupon={coupon}
                         key={'coupon' + coupon.id}/>);
      }
    );

    return(
      <table className="table table-striped" width="auto">
        <thead>
          <tr>
            <th className="col-md-2">Image url</th>          
            <th className="col-md-2">Title</th>
            <th className="col-md-6">Description</th>
            <th className="col-md-1">Price</th>
            <th className="col-md-1">Popularity</th>            
          </tr>
        </thead>
        <tbody>
          {coupons}
        </tbody>
      </table>
    )
  }
}