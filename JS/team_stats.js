// Team Stats, create, retrieve, add information
// object for team info
const team = {
    // create players object with three array values
    _players: [
      {firstName: 'Pete', lastName: 'Wheeler', age: 54},
      {firstName: 'John', lastName: 'Doe', age: 50},
      {firstName: 'Carl', lastName: 'Smith', age: 52}
      ],
    // create games object with three array values
    _games: [
      {opponent: 'Jet', teamPoints: 50, opponentPoints: 50},
      {opponent: 'Eagle', teamPoints: 60, opponentPoints: 55},
      {opponent: 'Lion', teamPoints: 70, opponentPoints: 60}
      ],
    // retrieve all players from object _players
      get players(){
        return this._players;
      },
    // retrieve all games from object _games
      get games(){
        return this._games;
      },
    // function to add new player
      addPlayer(newFirstName, newLastName, newAge){
        let player = {
          firstName: newFirstName, 
          lastName: newLastName, 
          age: newAge
        }
        this.players.push(player);
      },
   // function to add new game
      addGame(newOpponent, newTeamPoints, newOpponentPoints){
        let game = {
          opponents: newOpponent,
          teamPoints: newTeamPoints,
          opponentPoints: newOpponentPoints
        }
        this.games.push(game);
      }
  }
  // call addPlayer function and add arguments/values
  team.addPlayer('Bugs','Bunny', 76);
  // call addGames function and add arguments/values
  team.addGame('Titans', 100, 98);
  // print all players with the new added player
  console.log(team._players);
  // print all games with the new added game
  console.log(team._games);