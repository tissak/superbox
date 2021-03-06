# The MIT License (MIT)
# Copyright (c) 2013 Cory Brevik
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    return true if RUBYMOTION_ENV == 'test'
    
    SuperBox::Core.delete_all
    
    heaven = Heaven.create(:desc => "Where all Dogs go.")
    
    charlie = Dog.create(:name => "Charlie", :age => 6)
    itchy = Dog.create(:name => "Itchy", :age => 5)
    sparky = Dog.create(:name => "Sparky", :age => 2)
    
    heaven.addDogsObject(charlie)
    heaven.addDogsObject(itchy)
    heaven.addDogsObject(sparky)
    
    SuperBox::Core.save
    
    SuperBox::Core.dump
    
    puts "#{SuperBox::Heaven.all}"
    
    puts "#{SuperBox::Dogs.all}"
    
    puts "#{SuperBox::Dogs.single}"
    
    puts "#{SuperBox::Dogs.top(2)}"
    
    puts "#{SuperBox::Dogs.count}"
    
    puts "#{SuperBox::Dogs.order_by({:name => :asc, :age => asc}).all}"
    
    puts "#{SuperBox::Dogs.order_by({:name => :desc}).top(2)}"
    
    
    true
  end
end
