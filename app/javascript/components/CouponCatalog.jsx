import React from 'react';
import axios from 'axios';
import CouponList from './CouponList';
import CouponSearch from './CouponSearch';

export default class CouponCatalog extends React.Component {

    state = { coupons: [] };

    componentDidMount = () => {
        var self = this;
        axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
        axios.get('/coupons')
            .then(function (response) {
                console.log(response.data);
                self.setState({ coupons: response.data })
            })
            .catch(function (error) {
                console.log(error);
            });
    }; 

    handleSearch = (coupons) => {
      this.setState({ coupons: coupons });
    }; 

    render = () => {
        return (
          <div className="container">
            <div className="row">
                    <div className="col-md-12">
                        <CouponSearch handleSearch={this.handleSearch} />
                    </div>
                </div>
            <div className="row">
              <div className="col-md-12">
                  <CouponList coupons ={this.state.coupons}/>
              </div>
            </div>
          </div>
        );
    };
}