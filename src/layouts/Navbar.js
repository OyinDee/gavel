import React from 'react'
import { Link } from 'react-router-dom';

const Navbar = () => {
  return (
    <div>
        <nav className="justify-content-center navbar navbar-expand-lg navbar-dark bg-gavel">
            <div className="container-fluid">
                <Link className="navbar-brand" to="/">Gavel</Link>
                <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span className="navbar-toggler-icon"></span>
                </button>
                <div className="collapse navbar-collapse" id="navbarTogglerDemo02">
                    <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                        <li className="nav-item">
                            <Link className="nav-link" to="/">Home</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/about">Contact & About</Link>
                        </li>
                    </ul>
                </div>
<<<<<<< HEAD
                <Link className='btn btn-outline-gavel text-light ml-2 bg-warning fs-4' to="/distress">Alert!</Link>
=======

>>>>>>> b2fd50dec23c30857673fb1f03d0194fe47379dc
                <Link className='btn btn-outline-gavel text-light ml-2' to="/register">Register</Link>
                <Link className='btn btn-outline-gavel text-light' to="/login">Login</Link>
            </div>
        </nav>
    </div>
  )
}

export default Navbar;

// 0c1395