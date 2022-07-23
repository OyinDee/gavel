import React from 'react'
import './About.css'

const About = () => {
  return (
    <div className="a_container">
        <div className="w-50 card text-center" id='about_container'>
            <h1 className='card-title'>About Us</h1>
            <div style={{padding: '10px', textAlign: 'center'}}>
                <h2>OUR MISSION</h2>
                To promote peaceful and inclusive societies for sustainable development, provide access to justice for all and build effective, accountable and inclusive institutions at all levels.
                <br/><br/>
                <h2>OUR VISION</h2>
                To ensure public access to information and protect fundamental freedoms, prevent violence and combat terrorism and crime and ensure equal access to justice for all.
                <br/><br/>
                <h2>OUR GOAL</h2>
                To connect potential clients with lawyers without going through stress. We aim to provide a platform where people can air their grievances and get heard.
            </div>
        </div>
    </div>
    )
}

export default About;