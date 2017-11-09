# SixArm.com → Ruby → <br> HashMore class for dynamic hashes

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_hash_more.svg)](http://badge.fury.io/rb/sixarm_ruby_hash_more)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_hash_more.png)](https://travis-ci.org/SixArm/sixarm_ruby_hash_more)
[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_hash_more.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_hash_more)
[![Coverage Status](https://coveralls.io/repos/SixArm/sixarm_ruby_hash_more/badge.svg?branch=master&service=github)](https://coveralls.io/github/SixArm/sixarm_ruby_hash_more?branch=master)

* Git: <https://github.com/sixarm/sixarm_ruby_hash_more>
* Doc: <http://sixarm.com/sixarm_ruby_hash_more/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_hash_more>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [Changes](CHANGES.md), [License](LICENSE.md), [Contributing](CONTRIBUTING.md).

<!--header-shut-->


## Introduction

HashMore is a hash of hashes of hashes and so on recursively, enabling arbitrarily access (and assignment of values) to specific elements of a (multi-dimensional) hash, whether the element already exists or not.

For docs go to <http://sixarm.com/sixarm_ruby_hash_more/doc>

Want to help? We're happy to get pull requests.


<!--install-opent-->

## Install

### Gem

Run this command in your shell or terminal:

    gem install sixarm_ruby_hash_more

Or add this to your Gemfile:

    gem 'sixarm_ruby_hash_more'

### Require

To require the gem in your code:

    require 'sixarm_ruby_hash_more'

<!--install-shut-->


## Details

Ruby's built-in Hash class will raise an error if code attempts to access an element which doesn't exist; HashMore will create the necessary elements and then execute the access.

Additionally, using the += operator to assign a numeric value to an element


## Examples

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
