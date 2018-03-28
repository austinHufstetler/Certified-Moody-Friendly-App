import React from 'react';
import axios from 'axios';
import Select from 'react-select';
import 'react-select/dist/react-select.css';

export default class CouponFilter extends React.Component{
	state = {
		selectoption: ' ',
	}

	handleChange = (selectoption)=> {
		this.setState({selectoption});
		console.log('Selected: ${selectedoption.label}');
	}

	render(){
		const {selectoption} = this.state;
		const value = selectoption && selectoption.value;

		return(
			<Select name ="form-field-name"
					value = {value}
					onChange={this.handleChange}
					options={[
						{value: 'one', label: 'Expiration'},
						{value: 'two', label: 'Title'}
						]}
			/>
		);
	}
}