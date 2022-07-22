import React, { useState } from 'react'
import { Link } from 'react-router-dom';
import login_image from "../login_image_2.jpg"

const Login = () => {
    const [showPwd, setShowPwd] = useState(false);
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
  return (
    <div className='d-flex flex-lg-row flex-sm-column flex-md-column flex-xs-column'>
        <div className="col-5 ms-3">
            <div className='row'>
                <div className='container'>
                    <h4 className='display-4 text-center my-2'>Login</h4>
                    <input className='form-control w-100 my-3' value={email} onChange={(e) => setEmail(e.target.value)} placeholder='Email' />
                    <input type={showPwd ? "text" : "password"} value={password} onChange={(e) => setPassword(e.target.value)} className='form-control w-100 my-3' placeholder='Password' />
                    <div className=''>
                        <span className='mx-5'><input type="checkbox" onClick={() => setShowPwd(!showPwd)} /> Show Password </span>
                        <Link to="/forgot-password" className='mx-5'>Forgot password?</Link>
                    </div>
                    <button className="btn btn-outline-gavel w-100 my-3">Login</button>
                    <p className='text-center'>Don't have an account? <Link to="/register">Register</Link></p>
                </div>
            </div>
        </div>
        <div className='col-7'>
            <img src={login_image} alt="Law" className='w-100 h-100' width="250px" />
        </div>
    </div>
  )
}

export default Login;