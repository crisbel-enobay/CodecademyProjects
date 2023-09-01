// Finding out dogs yrs, convert human age to dog years
// a variable with a value of my current age
var myAge = 22;
// first 2 yrs of dogs
let earlyYears = 2;
// first 2 yrs of dogs life count as 10.5 of dog yrs
earlyYears *= 10.5;
// 2 yrs have been accountable so take it from myAge
let laterYears = myAge - 2;
// per yr is equivalent to 4 yrs in dog years
laterYears *= 4;
// add early years and later years to compute my age  in dog yrs
var myAgeInDogYears = earlyYears + laterYears;
// print to view what is the result with early and later years
console.log(earlyYears);
console.log(laterYears);
// print to view my dog year age
console.log(myAgeInDogYears);
// convert str to lower cases
var myName = 'Crisbel'.toLowerCase();
// print a sentence with my name, age in human and dog year
console.log(`My name is ${myName}. I am ${myAge} years old in human years which is ${myAgeInDogYears} years old in dog years.`);
