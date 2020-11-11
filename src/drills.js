'use strict';
require('dotenv').config()
const knex = require('knex');

const knexInstance = knex({
  client: 'pg',
  connection: process.env.DB_URL,
});

// Get all items that contain text
// takes one parameter which will be any string. function will query shopping_list table and select the rows which have a name that contains the searchTerm using a case insensitive match
function searchByName(searchTerm) {
  knexInstance
    .select('*')
    .from('shopping_list')
    .where('product_name', 'ILIKE', `%${searchTerm}%`)
    .then((result) => {
      console.log('SEARCH TERM', { searchTerm })
      console.log(result);
    });
}

// searchByName('steak');

// Get all items paginated
// takes one parameter which will be a number. Function will query the shopping_list table using knex methods and select the pageNumber page of rows paginated to 6 items per page
function searchByPage(pageNumber) {
  const productsPerPage = 6;
  const offset = productsPerPage * (pageNumber - 1);
  knexInstance
    .select('*')
    .from('shopping_list')
    .limit(productsPerPage)
    .offset(offset)
    .then((result) => {
      console.log('PAGINATE ITEMS', { page })
      console.log(result);
    });
}

// searchByPage(1);

// Get all items added after Date
// take one parameter which will be a number representing a number of days. Function will query the shopping_list table using knex methods and select the rows which have a date_added that is greater than daysAgo
function searchItemsAfterDate(daysAgo) {
  knexInstance
    .select('*')
    .from('shopping_list')
    .where(
      'date_added',
      '>',
      knexInstance.raw(`now() - '${daysAgo} days'::INTERVAL`)
    )
    .then((result) => {
      console.log('PRODUCTS ADDED DAYS AGO')
      console.log(result);
    });
}

searchItemsAfterDate(1);

// get the total cost for each category
// take no parameters. Function will query the shopping_list table and select the rows grouped by their category and showing the total price for each category
function findTotalCost() {
  knexInstance
    .select('category')
    .sum('price')
    .from('shopping_list')
    .groupBy('category')
    .then((result) => {
      console.log('COST PER CETEGORY');
      console.log(result);
    });
}

findTotalCost();
