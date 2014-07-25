puts expand = defined?( expand ) ? expand : true

#  Here is my best guess. As soon as variable on the LHS, expand is assisgned, it is automatically initializedi as "local-variable", but not assigned, hence the default value nil.
#  so when defined?( expand ) is evaluated on RHS, it returns true. But the value  has not been assigned, thus nil, which now gets explicitely assigned due to the statement.

