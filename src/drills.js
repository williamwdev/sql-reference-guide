'use strict';

const knex = require('knex');

const knexInstance = knex({
  client: 'pg',
  connection: 'postgresql://dunder_mifflin@localhost/knex-practice',
});

// Get all items that contain text
// takes one parameter which will be any string. function will query shopping_list table and select the rows which have a name that contains the searchTerm using a case insensitive match
function searchTerm(query) {
  knexInstance
    .select('*')
    .from('shopping_list')
    .where('product_name', 'ILIKE', `%${query}%`)
    .then((result) => {
      console.log(result);
    });
}

searchTerm('steak');


// Get all items paginated

// Get all items added after Date

// get the total cost for each category
