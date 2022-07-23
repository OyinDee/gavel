import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from "axios";

const Auth = ({user}) => {
  const url = "";
  const navigate = useNavigate();
  useEffect(() => {
    const token = localStorage.getItem("token");
    axios.get(url, {headers: 
    {
      "Authorization": `Bearer ${token}`,
      "Content-Type": "application/json",
      "Accept": "application/json"
    }
  }).then((res) => {
    if(res.data.status == false) {
      localStorage.removeItem("token");
      navigate("/login");
    } else {
      if(res.data.user == "user") {
        user(res.data.user);
        navigate("/user-dashboard");
      } else {
        user(res.data.user);
        navigate("/attorney");
      }
    }
  })
  }, []);
  return (
    <div>Auth</div>
  )
}

export default Auth;