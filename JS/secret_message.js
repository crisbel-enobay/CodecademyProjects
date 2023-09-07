// Secret Message using Array Methods
let secretMessage = ['Learning', 'is', 'not', 'about', 'what', 'you', 'get', 'easily', 'the', 'first', 'time,', 'it', 'is', 'about', 'what', 'you', 'can', 'figure', 'out.', '-2015,', 'Chris', 'Pine,', 'Learn', 'JavaScript'];
// .pop remove the last string of the array
secretMessage.pop();
// .length counts the number of item inside the array
console.log(secretMessage.length);
// .push add string index at the end of the array
secretMessage.push('to','Program');
// update string depends on the index specify
secretMessage[7] = 'right';
// remove the first string
secretMessage.shift();
// add string at the beginning of the array
secretMessage.unshift('Programming');
// .splice update range index
secretMessage.splice(6, 5, 'know');
// join string array
console.log(secretMessage.join());