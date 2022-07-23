import React from 'react'
import { Link } from 'react-router-dom';

const Navbar = () => {
  return (
    <div>
        <nav className="navbar navbar-expand-lg navbar-dark bg-gavel">
            <div className="container-fluid" style={{position: 'relative', marginRight: '0'}}>
                <Link className="navbar-brand fs-2" to="/" style={{fontFamily : 'ink free'}}>Gavel</Link>
                <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span className="navbar-toggler-icon"></span>
                </button>
                <div className="collapse navbar-collapse" id="navbarTogglerDemo02">
                    <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                        <li className="nav-item">
                            <Link className="nav-link" to="/">Home</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/about">About</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/contact">Contact</Link>
                        </li>
                    </ul>
                </div>
                <Link className='btn btn-outline-gavel text-light ml-2 bg-warning fs-4' to="/distress">Alert!</Link>
                <Link className='btn btn-outline-gavel text-light ml-2' to="/register">Register</Link>
                <Link className='btn btn-outline-gavel text-light' to="/login">Login</Link>
            </div>
        </nav>
    </div>
  )
}

export default Navbar;

// 0c1395