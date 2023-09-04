// Magic Eight Ball, user will input question and the program will output random fortune
// username can be inputted by any name
var userName = 'Jane';
// if the user input the name jane then display 'Hello, Jane!' otherwise 'Hello!'
userName === 'Jane' ? console.log('Hello, Jane!') : console.log('Hello!');
// userQuestion can be inputted with any question
var userQuestion = 'Will I become successful?';
console.log('I am ' + userName + ' my question is ' + userQuestion);
// generate random number for random magic ball answer
var randomNumber = Math.floor(Math.random() * 8);
// declare an eightBall variable for storing random fortune answer
let eightBall = '';
// loop with random number with eightBall value being change every random number
switch(randomNumber){
  case 0:
    eightBall = 'It is certain';
    break;
  case 1:
    eightBall = 'It is decidedly so';
    break;
  case 2:
    eightBall = 'Reply hazy try again';
    break;
  case 3:
    eightBall = 'Cannot predict now';
    break;
  case 4:
    eightBall = 'Do not count on it';
    break;
  case 5:
    eightBall = 'My sources say no';
    break;
  case 6:
    eightBall = 'Outlook not so good';
    break;
  default:
    eightBall = 'Signs point to yes';
    break;
}
console.log(eightBall);