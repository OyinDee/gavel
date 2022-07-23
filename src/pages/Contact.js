import React, { useEffect } from 'react'
import './Contact.css'
import { FaPhoneAlt } from "react-icons/fa";
import { FaAddressCard} from "react-icons/fa";
import { FaTwitter} from "react-icons/fa";
import { FaFacebookSquare} from "react-icons/fa";
import { Link } from 'react-router-dom';
import Navbar from '../layouts/Navbar';

const Contact = () => {
  useEffect(() => {
    document.title = "Gavel || Contact"
  })
  return (
    <div>
      <Navbar />
      <div className="c_container">
        <div className="w-50 card text-center" id='contact_container'>
            <h1 className='card-title'>Contact Us</h1>
            <hr/>
            <div style={{padding: '10px', textAlign: 'center'}}>
            <p className='fs-5 text'>
            <FaPhoneAlt/> +2348102347835
            <br/>
            <br/>
            <FaAddressCard/><Link to="/twitter">  contactgavel@gmail.com</Link>
            <br/>
            <br/>
            <FaTwitter/><Link to="/twitter"> gavel_justiceforall</Link>
            <br/>
            <FaFacebookSquare/> <Link to="/twitter">_gavel</Link>
            </p>
        </div>
      </div>
    </div>
    <div className='w-100 footer fs-5 text text-light' style={{backgroundColor: '#0c1395'}}> lorem ipsum dolor sit amet</div>
    </div>
  )
}

export default Contact;