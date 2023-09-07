// Whale Talk talk with only vowels and e and u vowels are longer than the rest
// input can be change to any string
let input = 'turpentine and turtles';
// array used to check the vowels from input
const vowels = ['a','e','i','o','u'];
// used to store the result for whale talk
let resultArray = [];
// loop to check and get vowels from the input
for(let i = 0; i < input.length; i++){
  for(let j = 0; j < vowels.length; j++){
    if(input[i] === vowels[j]){
      resultArray.push(input[i].toUpperCase());
      if(input[i] === 'e' || input[i] === 'u'){
        resultArray.push(input[i].toUpperCase());
      }
    }
  }
}
// used for joining every string from result array into one sentence
const resultString = resultArray.join('');
// print the result
console.log(resultString);

