// Rock, Paper, Scissors
// arrow function for user input only rock, paper, scissors otherwise Error
const getUserChoice = userInput => {
    userInput = userInput.toLowerCase();
    if(userInput === 'rock' || userInput === 'paper' || userInput === 'scissor'){
      return userInput;
    }
    else{
      return console.log('ERROR');
    }
  }
  // random choice for computer with either rock, paper, scissors
  function getComputerChoice(){
    let randomNumber = Math.floor(Math.random()*3);
    switch (randomNumber) {
    case 0:
      return 'rock';
      break;
    case 1:
      return 'paper';
      break;
    default:
      return 'scissors';
      break;
    }
  }
  // function to determine the winner
  function determineWinner(userChoice, computerChoice){
    if(userChoice === computerChoice){
      return 'The game is a tie!';
    }
    if(userChoice === 'rock'){
      if(computerChoice === 'paper'){
        return 'The computer won!';
      } else{
        return 'You won';
      }
    }
    if(userChoice === 'paper'){
      if(computerChoice === 'scissors'){
        return 'The computer won!';
      } else{
        return 'You won';
      }
    }
    if(userChoice === 'scissors'){
      if(computerChoice === 'rock'){
        return 'The computer won!';
      } else{
        return 'You won';
      }
    }
  }
  // function for overall game
  function playGame(){
    userChoice = getUserChoice('rock');
    computerChoice = getComputerChoice();
    console.log('You threw: ' + userChoice);
    console.log('Computer threw: ' + computerChoice);
    console.log(determineWinner(userChoice, computerChoice));
  }
  // playGame invocation
  playGame();