// Meal Maker using menu object, getters, setters
// object for the menu
const menu = {
    // _ is a naming convention used to say the variable is mutable but not directly manipulated
    _meal: '',
    _price: 0,
    // set is used to prevent having incorrect value
    // check whether the inputted meal is a string if not return the original value if yes return the inputted string
    set meal(mealToCheck){
      if(typeof mealToCheck === 'string'){
        return this._meal = mealToCheck;
      }
    },
    // check whether the inputted price is a number if not return the original value if yes return the inputted number
    set price(priceToCheck){
      if(typeof priceToCheck === 'number'){
        return this._price = priceToCheck;
      }
    },
    // get is used to get the value from the setters
    // check whether theres a value or none
    get todaysSpecial(){
      if(this._meal && this._price){
        return `Today's Special is ${this._meal} for $${this._price}!`;
      }else{
        return 'Meal or price was not set correctly!';
      }
    }
  }
  // reassigning values to _meal and _price by using the setter meal function
  menu.meal = 'pizza';
  menu.price = 50;
  // calling out the getter todaysSpecial function
  console.log(menu.todaysSpecial);