import { useState, useEffect } from 'react';
import axios, { CancelToken } from 'axios';
import { LatLngTuple } from 'leaflet';

export type Beer = {
  id: string,
  name: string,
  coordinates: LatLngTuple,
};

export const getBeerList = function(cancelToken?: CancelToken): Promise<Beer[]> {
  return axios
    .get('/api/beers', {
      cancelToken,
    })
    .then((res) => res.data)
    .catch((err) => {
      if (axios.isCancel(err)) {
        return [];
      }
      throw err;
    });
};

export const useBeerList = function(): Beer[] {
  const [ list, setList ] = useState<Beer[]>([]);

  useEffect(() => {
    const source = axios.CancelToken.source();
    getBeerList(source.token)
      .then((result) => setList(result))
      .catch(console.error);

    return () => {
      source.cancel('nope!');
    };
  }, []);

  return list;
};
