var express = require('express');
var app = express();

app.get('/', (req, res) => {
    res.status(200).json({message: "Yes! Working!"})
});

var server = app.listen(45442, function() {
    console.log('Listening on port 45442')
})