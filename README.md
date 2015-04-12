# Visualize
A high level library for making attractive and informative statistical graphics painless in Ruby.

<br>

## Examples
###### exampleProtovis.rb
```
$ ruby exampleProtovis.rb
```

###### exampleVega.rb

This example requires (at the moment) to have node.js and the Vega library installed, in OS X it can be done with:
```
$ brew install node
$ wget https://raw.githubusercontent.com/LearnBoost/node-canvas/master/install -O - | sh
$ npm install vega -g
```

And then just execute it normally.
```
$ ruby exampleProtovis.rb
```

<br>

## Classes
##### Plot (without DSL yet)
Is the main class and the frontend of the library, it contains all the functionality that the user should see and use.

##### Palette (Not yet implemented)
Is auxiliary class of the frontend, it contains all the functionality related with color schemas.

##### Engine
Is the core class of the backend, it represent the abstraction level over all the different libraries.

##### VegaEngine
Is an specific implementation of the Engine class using the Vega (through Plotrb) as a backend.

##### ProtovisEngine
Is an specific implementation of the Engine class using the Protovis (through Rubyvis) as a backend.

##### GnuplotEngine (Not yet implemented)
Is an specific implementation of the Engine class using the Gnuplot (through ruby-gnuplot) as a backend.
