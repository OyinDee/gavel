import axios from 'axios';
import React, { useEffect } from 'react'
import { Link } from 'react-router-dom';
import Navbar from '../layouts/Navbar';
import './Home.css'

const Home = () => {
  const getLocation=()=>{
    navigator.geolocation.getCurrentPosition((response)=>{
          const rc=response.coords;
          const latitude=rc.latitude;
          const longitude=rc.longitude;
          axios.get(`https://geocode.arcgis.com/arcgis/rest/services/World/GeocodeServer/reverseGeocode?f=pjson&featureTypes=&location=${longitude},${latitude}`).then((res) => {
            console.log(res);
          })
    })
  }
  useEffect(() => {
    document.title = "Gavel || Home";
  })

  return (
    <div>
      <Navbar />
      <div className='home_background text-center'>
        <div className='fs-5 text text-light'>Justice for One, Justice for all</div>
        <div className='fs-1 text text-light'>LET US BRIDGE THE GAP FOR YOU</div>
        <Link className='btn text-light btn-outline-gavel fs-3 px-4' to="/register">Register now</Link> <br />
        <button className='btn btn-warning text-light fs-3 px-5 mt-2' onClick={getLocation}>Distress call</button> 

      </div>
    </div>
  )
}

export default Home;