import React from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';

export default class CouponSearch extends React.Component {

  handleSearch = () => {
    var query = ReactDOM.findDOMNode(this.refs.query).value;

    var self = this;
    axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
    axios.get('/search', {params: {query: query }}) // giving the function calling in 
    // coupon_search contrlloer.
    
      .then(function (response) {
        console.log(response.data);
        self.props.handleSearch(response.data);
      })
      .catch(function (error) {
        console.log(error);
        alert('Cannot sort events: ', error);
    });
  };

  render = () => {
    return(
      <input onChange={this.handleSearch}
             type="text"
             className="form-control"
             placeholder="Search by title, business name, or category"
             ref="query" />
   
    );
  };
}