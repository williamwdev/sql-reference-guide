'use strict';

const knex = require('knex');

const knexInstance = knex({
  client: 'pg',
  connection: 'postgresql://dunder_mifflin@localhost/knex-practice',
});

// Get all items that contain text
// takes one parameter which will be any string. function will query shopping_list table and select the rows which have a name that contains the searchTerm using a case insensitive match
function searchByName(searchTerm) {
  knexInstance
    .select('*')
    .from('shopping_list')
    .where('product_name', 'ILIKE', `%${searchTerm}%`)
    .then((result) => {
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
      console.log(result);
    });
}

// searchByPage(1);

// Get all items added after Date
// take one parameter which will be a number representing a number of days. function will query the shopping_list table using knex methods and select the rows which have a date_added that is greater than daysAgo
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
      console.log(result);
    });
}

searchItemsAfterDate(1);

// get the total cost for each category
