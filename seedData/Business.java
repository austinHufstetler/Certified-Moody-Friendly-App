public class Business{
	String address;
	String name;
	String city;
	String email;
	String state;
	String zip;
	public Business(String address, String name, String city, String email, String state, String zip){
		this.address = address;
		this.name = name;
		this.city = city;
		this.email = email;
		this.state = state;
		this.zip = zip;
	}

	public String createBusiness(){
		return "Business.create!( :name => \'"+ this.name +"\', :address => \"" +this.address +", "+this.city +", "+ this.state+ " " + this.zip +"\",  logo_url: open('app/assets/images/placeholder.png'))";
	}

	public String createAccount(){
		return "Account.create!( :email => \'"+ this.email +"\', :password => \'changeme\', :password_confirmation => \'changeme\', :approved => true, :accountable => Business.find_by_name(\"" + this.name + "\"))";
	}
}