import React, { useEffect } from 'react'
import Navbar from '../layouts/Navbar';
import './Home.css'

const Home = () => {
  useEffect(() => {
    document.title = "Gavel || Home";
  })
  return (
    <div>
      <Navbar />
      <div className='home_background text-center'>
        <div className='fs-5 text text-light'>Justice for One, Justice for all</div>
        <div className='fs-1 text text-light'>LET US BRIDGE THE GAP FOR YOU</div>
        <button className='btn text-light btn-outline-gavel fs-3 px-4'>Register now</button> <br />
        <button className='btn btn-warning text-light fs-3 px-5 mt-2'>Distress call</button> 

      </div>
    </div>
  )
}

export default Home;