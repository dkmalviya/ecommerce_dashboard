class AddressModel {
  String addressId;
  String name;
  String houseNumber ;
  String street ;
  String area ;
  String landmark ;
  String city ;
  String pincode ;
  String contactNumber ;


  AddressModel();

  @override
  String toString() {
    return 'AddressModel{addressId: $addressId, name: $name, houseNumber: $houseNumber, street: $street, area: $area, landmark: $landmark, city: $city, pincode: $pincode, contactNumber: $contactNumber}';
  }
}