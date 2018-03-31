import React from 'react';
import axios from 'axios';
import CouponList from './CouponList';
import CouponSearch from './CouponSearch';
import CouponFilter from './CouponFilter';

export default class CouponCatalog extends React.Component {

    state = { coupons: [], sort: "title", order: "asc"};

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

    handleChange =(name, order)=>{
        if (this.state.sort != name) {
                order = 'asc';
        }

        var self = this;

        axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
        axios.get('/coupons', {params: {sort_by: name, order: order }}).then(function (response) {
            console.log(response.data);
            self.setState({ coupons: response.data, sort: name, order: order });
        })
        .catch(function (error) {
            console.log(error);
            alert('Cannot sort events: ', error);
        });
    };

    render = () => {
        return (
          <div className="container">
            <div className="row">
                    <table className="table noborder">
                        <td><CouponSearch handleSearch={this.handleSearch}  /> </td>
                        <td ><CouponFilter handleChange={this.handleChange} /></td>
                    </table>

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