import React from 'react';
import Coupon from './Coupon';
import CouponFilter from './CouponFilter';

export default class CouponList extends React.Component {

  handleCouponFilter = (name, order) => {
    this.props.handleSortColumn(name, order);
  };
  render = () => {
    var coupons = [];

    var self = this;

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
            <th className="col-md-2">Title </th>
            <th className="col-md-4">Description</th>
            <th className="col-md-2">Expiration Date</th>
          

          </tr>
        </thead>
        <tbody>
          {coupons}
        </tbody>
      </table>
    )
  }
}