import React from 'react';
import Coupon from './Coupon';
import CouponFilter from './CouponFilter';

export default class CouponList extends React.Component {

  handleCouponFilter = (name, order) => {
    this.props.handleCouponFilter(name, order);
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
            <th className="col-md-2 sortable">
                <CouponFilter name="title"
                            text="Title"
                            sort={this.props.sort}
                            order={this.props.order}
                            handleCouponFilter={this.handleCouponFilter}/>
             </th>
            <th className="col-md-2 ">Description</th>
          
          

          </tr>
        </thead>
        <tbody>
          {coupons}
        </tbody>
      </table>
    )
  }
}