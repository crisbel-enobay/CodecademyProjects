// Sleep Debt Calculator
// function to get user sleep everyday
function getSleepHours(day){
    switch(day){
      case 'monday':
        return 8;
        break;
      case 'tuesday':
        return 8;
        break;
      case 'wednesday':
        return 8;
        break;
      case 'thursday':
        return 8;
        break;
      case 'friday':
        return 8;
        break;
      case 'saturday':
        return 10;
        break;
      case 'sunday':
        return 8;
        break;
      default:
        return 'input valid day. e.g: monday';
        break;
    }
  }
  // function to get the total sleep you had the whole week
  const getActualSleepHours = () => {
    return getSleepHours('monday') + getSleepHours('tuesday') + getSleepHours('wednesday') + getSleepHours('thursday') + getSleepHours('friday') + getSleepHours('saturday') +
    getSleepHours('sunday'); 
  }
  // function to get the ideal sleep hrs every day
  const getIdealSleepHours = (idealHours) => idealHours * 7;
  // function that decide whether your actual sleep hrs and ideal sleep hours is perfect, higher or lower than necessary
  const calculateSleepDebt = () => {
    actualSleepHours = getActualSleepHours();
    idealSleepHours = getIdealSleepHours(9);
    if(actualSleepHours === idealSleepHours){
      console.log('You got the perfect amount of sleep');
    }
    else if(actualSleepHours > idealSleepHours){
      console.log('You got ' + (actualSleepHours - idealSleepHours) + ' hrs more sleep than needed');
    }
    else{
      console.log('You got ' + (idealSleepHours - actualSleepHours) + ' hrs less than the ideal sleep. Get some rest.');
    }
  }
  // function invocation
  calculateSleepDebt();