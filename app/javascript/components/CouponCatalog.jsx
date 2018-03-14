import React from 'react';
import axios from 'axios';
import CouponList from './CouponList';

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

    render = () => {
        return (
          <div className="container">
            <div className="row">
              <div className="col-md-12">
                  <CouponList coupons ={this.state.coupons}/>
              </div>
            </div>
          </div>
        );
    };
}