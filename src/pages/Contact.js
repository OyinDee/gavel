import React from 'react'
import './Contact.css'
import { FaPhoneAlt } from "react-icons/fa";
import { FaAddressCard} from "react-icons/fa";
import { FaTwitter} from "react-icons/fa";
import { FaFacebookSquare} from "react-icons/fa";
import { Link } from 'react-router-dom';
import Navbar from '../layouts/Navbar';

const Contact = () => {
  return (
    <div>
      <Navbar />
      <div className="c_container">
        <div className="w-75 card text-center" id='contact_container'>
            <h1 className='card-title'>Contact Us</h1>
            <div style={{padding: '10px', textAlign: 'center'}}>
            <p className='fs-3 text'>
            <FaPhoneAlt/> +2348102347835
            <br/>
          
            <FaAddressCard/><Link to="/twitter"> contactgavel@gmail.com</Link>
            <br/>
            
            <FaTwitter/><Link to="/twitter"> gavel_justiceforall</Link>
            <br/>
            
            <FaFacebookSquare/> <Link to="/twitter">_gavel</Link>
            </p>
        </div>
      </div>
    </div>
    </div>
  )
}

export default Contact;