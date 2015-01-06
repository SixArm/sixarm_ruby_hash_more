# SixArm.com » Ruby » <br> HashMore class for dynamic hashes

[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_hash_more.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_hash_more)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_hash_more.png)](https://travis-ci.org/SixArm/sixarm_ruby_hash_more_bravo)

* Doc: <http://sixarm.com/sixarm_ruby_hash_more/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_hash_more>
* Repo: <http://github.com/sixarm/sixarm_ruby_hash_more>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

HashMore is a hash of hashes of hashes and so on recursively, enabling arbitrarily access (and assignment of values) to specific elements of a (multi-dimensional) hash, whether the element already exists or not.

For docs go to <http://sixarm.com/sixarm_ruby_hash_more/doc>

Want to help? We're happy to get pull requests.


## Install quickstart

Install:

    gem install sixarm_ruby_hash_more

Bundler:

    gem "sixarm_ruby_hash_more", "~>1.3.0"

Require:

    require "sixarm_ruby_hash_more"


## Install with security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_hash_more --trust-policy HighSecurity


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


## Changes

* 2012-03-17 1.3.0 Upgrade for Ruby 1.9.3, minitest/spec, and improved docs.


## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind, 
express or implied, including but not limited to the warranties of 
merchantability, fitness for a particular purpose and noninfringement. 

In no event shall the authors or copyright holders be liable for any 
claim, damages or other liability, whether in an action of contract, 
tort or otherwise, arising from, out of or in connection with the 
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights, 
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2005-2012 Joel Parker Henderson
