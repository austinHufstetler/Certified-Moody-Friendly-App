import React from 'react';

export default class CouponCatalog extends React.Component {

    state = { coupons: [] };

    componentDidMount = () => {
        this.setState({ coupons: this.props.coupon_catalog });
    };

    render = () => {
        return(
            <div>
                <ul>
                    There are {this.state.coupons.length} tacos in the catalog.
                </ul>
            </div>
        );
    };
} 