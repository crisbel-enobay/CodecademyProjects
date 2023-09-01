// Finding out the fahrenheit temperature based on the conversion of celsius and kelvin
// newton scale conversion is optional
// Kelvin constant value, can be change to test result
const kelvin = 293;
// Celsius computation constant variable
const celsius = kelvin - 273;
// Fahrenheit computation in let variable type
let fahrenheit = celsius * (9/5) + 32;
// round down value for the fahrenheit
fahrenheit = Math.floor(fahrenheit);
// Newton Scale computation
let newton = celsius * (33/100);
// round down value for Newton Scale
newton = Math.floor(newton);
// print fahrenheit using string interpolation
console.log(`The temperature is ${fahrenheit} degrees Fahrenheit.`);
// print Newton Scale using string interpolation
console.log(`The temperature is ${newton} degrees Newton.`);
