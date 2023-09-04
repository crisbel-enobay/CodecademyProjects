// Race Day
// variable for participant race number that is generated randomly
let raceNumber = Math.floor(Math.random() * 1000);
// value can be change to either the participant arrived early(true) or not(false)
const registeredEarly = false;
// value can be change to any age
const age = 18;
// participants who is over 18 yrs old and arrive early got to have a number greater than 1000
if(age >= 18 && registeredEarly){
  raceNumber += 1000;
}
// participant over 18 and arrive early will race at 9:30am
if(age > 18 && registeredEarly){
  console.log('Early adults race start at 9:30 am with race number : ' + raceNumber);
}
// participant over 18 and did NOT arrive early will race at 11:00am
else if(age > 18 && !registeredEarly){
  console.log('Late adults race start at 11:00 am with race number : ' + raceNumber);
}
// participant under 18 and either arrive early or not will race at 12:30pm
else if(age < 18){
  console.log('Youth registrants race start at 12:30 pm with race number : ' + raceNumber);
}
// participant equals 18 and and either arrive early or not will go to the registration desk
else{
  console.log('Go to the registration desk');
}