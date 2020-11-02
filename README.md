# Features

Uber maintains an open source library called H3 which they use in their mobile apps. H3 is based on the concept of dividing the surface of the planet into a grid of hexigons or 'cells'. Each call has a unique identifier and a fixed size and location. The H3 code library can be used in various ways:
- Given a latitude/longitude point, find the index of the containing H3 cell 
- Given an H3 index, find the latitude/longitude cell center
- Given an H3 index, determine the cell boundary in latitude/longitude coordinates
- Find the coordinates of the 6 points for any cell
- Find the distance from a point to the cell edge

Furthermore, H3 defines more than one grid size for the planet. In fact H3 defines 16 distince 'resolutions' ranging from 0.0000009 km^2 up to 4,250,546.8477000 km^2. There is a parent/child relationship between two cells at adjacent resolutions. 

# Installation via Cocoapods

Just add this line to your Podfile

`
   pod 'H3', :git => 'git@github.com:ehmjaysee/h3-ios.git'

`