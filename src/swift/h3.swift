import CoreLocation

extension CLLocationCoordinate2D {
    // Find the H3 cell index for a given set of 2D coordinates
    public func h3CellIndex(resolution: Int32) -> UInt64 {
        let lat = degsToRads(latitude)
        let lon = degsToRads(longitude)
        var location = GeoCoord(lat: lat, lon: lon)
        let index = geoToH3(&location, resolution)
        
        return index
    }
    
    // Find the neighbor cells for a given set of 2D coordinates and ring size
    public func h3Neighbors(resolution: Int32, ringLevel: Int32) -> [H3Index] {
        let index = h3CellIndex(resolution: resolution)
        let count = Int(maxKringSize(ringLevel))
        var neighbors = Array(repeating: H3Index(), count: count)
        kRing(index, ringLevel, &neighbors);
        
        return neighbors
    }
}

extension UInt64 {
    public func h3ToHexagon() -> [CLLocationCoordinate2D] {
        var locations = GeoBoundary()
        h3ToGeoBoundary(self, &locations)
        
        return [
            .init(latitude: locations.verts.0.lat, longitude: locations.verts.0.lon),
            .init(latitude: locations.verts.1.lat, longitude: locations.verts.1.lon),
            .init(latitude: locations.verts.2.lat, longitude: locations.verts.2.lon),
            .init(latitude: locations.verts.3.lat, longitude: locations.verts.3.lon),
            .init(latitude: locations.verts.4.lat, longitude: locations.verts.4.lon),
            .init(latitude: locations.verts.5.lat, longitude: locations.verts.5.lon),
            .init(latitude: locations.verts.0.lat, longitude: locations.verts.0.lon)
        ]
    }
}
