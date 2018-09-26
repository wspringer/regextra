# README

Wraps an object around regular expressions, allowing you to call `map`,
`forEach` and `reduce` to handle the results of applying the regular expression
to a string.

```javascript
const regextra = require('regextra');

re = regextra(/[0-9]+/g);
re.match('123 456').forEach(console.info);
re.match('123 456').map(([match]) => parseInt(match));
re.match('123 456').reduce(…)
```