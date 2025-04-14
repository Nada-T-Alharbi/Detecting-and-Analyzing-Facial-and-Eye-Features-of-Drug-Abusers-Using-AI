import 'package:bdd_widget_test/bdd_widget_test.dart';

const express = require('express');
const cors = require('cors');

const app = express();

// Enable CORS for all routes
app.use(cors());

// Your routes here

app.listen(5000, () => console.log('Server running on port 5000'));
