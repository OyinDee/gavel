import React from 'react'
import Navbar from '../layouts/Navbar';
import './About.css'

const About = () => {
  return (
    <div>
        <Navbar />
        <div className="a_container">
            <div className="w-50 card text-center" id='about_container'>
                <h1 className='card-title'>About Us</h1>
                <hr/>
                <div style={{padding: '10px', textAlign: 'center'}}>
                    <h4>OUR MISSION</h4>
                    To promote peaceful and inclusive societies for sustainable development, provide access to justice for all and build effective, accountable and inclusive institutions at all levels.
                    <br/><br/>
                    <h4>OUR VISION</h4>
                    To ensure public access to information and protect fundamental freedoms, prevent violence and combat terrorism and crime and ensure equal access to justice for all.
                    <br/><br/>
                    <h4>OUR GOAL</h4>
                    To connect potential clients with lawyers without going through stress. We aim to provide a platform where people can air their grievances and get heard.
                </div>
            </div>
        </div>
    </div>
    )
}

export default About;