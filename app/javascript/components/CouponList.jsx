import React from 'react';
import Coupon from './Coupon';
import CouponFilter from './CouponFilter';

export default class CouponList extends React.Component {

  // filtering the coupons 
  
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
 // here 
    return(

      <table className="table bg-info table-hover mobi" width="auto">
        <thead>
          <tr>
            <th className="col-md-2">Image url</th>          
            <th className="col-md-2 sortable">
                <CouponFilter name="title"
                            text="Title"
                            sort={this.props.sort} //gives the functionality to be sorted 
                            order={this.props.order}
                            handleCouponFilter={this.handleCouponFilter}/>
             </th>
            <th className="col-md-2 ">Description</th>
            <th className="col-md-2">Category</th>  
            <th className="col-md-2">Business</th>  
          
          

          </tr>
        </thead>
        <tbody className="mobi">
          {coupons}
        </tbody>
      </table>
    )
  }
}