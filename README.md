# SixArm.com » Ruby » <br> HashMore class for dynamic hashes

* Docs: <http://sixarm.com/sixarm_ruby_hash_more/doc>
* Repo: <http://github.com/sixarm/sixarm_ruby_hash_more>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

HashMore is a hash of hashes of hashes and so on recursively, enabling arbitrarily access (and assignment of values) to specific elements of a (multi-dimensional) hash, whether the element already exists or not.

For docs go to <http://sixarm.com/sixarm_ruby_hash_more/doc>

Want to help? We're happy to get pull requests.


## Quickstart

Install:

    gem install sixarm_ruby_hash_more

Bundler:

    gem "sixarm_ruby_hash_more", "=1.2.8"

Require:

    require "sixarm_ruby_hash_more"


## Details

Ruby's built-in Hash class will raise an error if code attempts to access an element which doesn't exist; HashMore will create the necessary elements and then execute the access.

Additionally, using the += operator to assign a numeric value to an element


## Examples

    require "sixarm_ruby_hash_more"
    hash = HashMore.new
    hash["red"]["apple"] = true
    hash["red"]["dress"] = true
    hash["red"]["truck"] = true
  
    hash["red"] => {"apple"=>true, "dress"=>true, "truck"=>true}


## Counting and Totals

This class is also useful for building aggregate data about a set of similar objects, such as how many employees are in each department of each division of a company or total tax and sale amounts for a set of invoices by customer by year.

Counting example:

    h = HashMore.new
    employees = Employee.all
    for e in employees 
      h[e.division][e.department]+=1
    end
  
    h['sales']['east coast] => 28
    h['sales']['west coast] => 23

Totals example:

    h = HashMore.new
    invoices = Invoices.all
  
    for i in invoices
      h[i.customer.name][i.sale_date.year]['tax'] += i.tax_amount
      h[i.customer.name][i.sale_date.year]['sale'] += i.sale_amount
   end
  
    h['Acme Corp']['2008']['tax'] => 12039.12
    h['Acme Corp']['2009']['sale'] => 102649

