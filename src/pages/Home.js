import React, { useEffect } from 'react'
import Navbar from '../layouts/Navbar';

const Home = () => {
  useEffect(() => {
    document.title = "Gavel || Home";
  })
  return (
    <div>
      <Navbar />
    </div>
  )
}

export default Home;