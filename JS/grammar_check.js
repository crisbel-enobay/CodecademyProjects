// Grammar Checker, uses of iteratory methods
// a given variable and value for the story to grammarly check
let story = 'Last weekend, I took literally the most beautifull bike ride of my life. The route is called "The 9W to Nyack" and it stretches all the way from Riverside Park in Manhattan to South Nyack, New Jersey. It\'s really an adventure from beginning to end! It is a 48 mile loop and it literally took me an entire day. I stopped at Riverbank State Park to take some artsy photos. It was a short stop, though, because I had a freaking long way to go. After a quick photo op at the very popular Little Red Lighthouse I began my trek across the George Washington Bridge into New Jersey. The GW is a stunning 4,760 feet long! I was already very tired by the time I got to the other side. An hour later, I reached Greenbrook Nature Sanctuary, an extremely beautifull park along the coast of the Hudson. Something that was very surprising to me was that near the end of the route you literally cross back into New York! At this point, you are very close to the end.';
//given variable and values, .split was used to make an array out of the variable story
let storyWords = story.split(' ');
let unnecessaryWord = 'literally';
let misspelledWord = 'beautifull';
let badWord = 'freaking';
// initial value for counting the total words inside the story
let count = 0;
// forEach used to count every word inside the story
storyWords.forEach((word) => {
  return count++;
});
// print the total words
console.log(count);
// .filter returns only what is true, in this case it wont return the word equal to unnecessaryWord
storyWords = storyWords.filter((word) => {
  return word !== unnecessaryWord;
});
// .map updates the value from the condition 
storyWords = storyWords.map((word) => {
  return word === misspelledWord ? 'beautiful' : word;
});
// .findIndex finds the index of the condition given
const badWordIndex = storyWords.findIndex((word) => {
  return word === badWord;
})
// print the index from badWordIndex
console.log(badWordIndex);
// change the index 78 to the word really
storyWords[78] = 'really';
// .every check whether there are words greater than or equal to 10, return boolean
const lengthCheck = storyWords.every((word) => {
  return word.length <= 10;
})
// print true or false
console.log(lengthCheck);
// search and return the word greater than 10
storyWords.forEach((word) => {
  return word.length > 10 && console.log(word);
})
// .join(''), joins the array of words to make it readable and '' argument removes all the commas
console.log(storyWords.join(' '));