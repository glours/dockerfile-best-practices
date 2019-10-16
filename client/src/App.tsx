import React from 'react';
import { Icon } from 'leaflet';
import { Map, Marker, Popup, TileLayer } from 'react-leaflet';
import markerShadow from 'leaflet/dist/images/marker-shadow.png';
import markerIcon from 'leaflet/dist/images/marker-icon.png';
import 'leaflet/dist/leaflet.css';

import { useBeerList } from './server';
import './App.css';

const icon = new Icon({
  iconAnchor: [12, 41],
  iconSize: [25, 41],
  iconUrl: markerIcon,
  shadowSize: [41, 41],
  shadowUrl: markerShadow,
});

const position = {
  center: {
    lat: 50.68601788918605,
    lng: 4.435729980468751,
  },
  zoom: 8,
};

const App: React.FC = () => {
  const beers = useBeerList();

  return (
    <Map
      className="map"
      center={position.center}
      zoom={position.zoom}
    >
      <TileLayer
        url="https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png"
      />
      {beers.map((beer) => (
        <Marker key={beer.id} icon={icon} position={beer.coordinates}>
          <Popup>{beer.name}</Popup>
        </Marker>
      ))}
    </Map>
  );
}

export default App;
