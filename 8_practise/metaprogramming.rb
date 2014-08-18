# class Person; end

################################# Class methods

# class Person
#   def self.species
#     "Homo Sapiens"
#   end
# end

# class Person
#   class << self
#     def species
#       "Homo Sapiens"
#     end
#   end
# end

# class << Person
#   def species
#     "Homo Sapiens"
#   end
# end

# Person.instance_eval do
#   def species
#     "Homo Sapiens"
#   end
# end

# def Person.species
#   "Homo Sapiens"
# end
#
# puts Person.species

################################# Instance methods

# class Person
#   def name
#     "Matz"
#   end
# end

# Person.class_eval do
#   def name
#     "Matz"
#   end
# end
#
# p = Person.new
# puts p.name

################################# Metaprogramming
# class Person; end
#
# p Person.class
#
# class Class
#   def loud_name
#     "#{name.upcase}"
#   end
# end
#
# p Person.loud_name

################################# Each object has its own metaclass
matz = Object.new
def matz.speak
  "Hello how are you?"
end

# puts matz.speak # matz is inherited from its metaclass, which is inherited from Object
#
# # metaclass is invisible
# puts matz.class

################################# Access metaclass
metaclass = class << matz; self; end
p metaclass.instance_methods