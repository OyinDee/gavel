import React, { useEffect, useState } from 'react'
import { useNavigate } from 'react-router-dom';
import Post from '../components/Post';
import axios from "axios";

const Posts = () => {
  // const [user, setUser] = useState("")
  //   const url = "https://gavell.herokuapp.com/dashboard";
  //   const navigate = useNavigate();
  //   useEffect(() => {
  //       const token = localStorage.getItem("token");
  //       axios.get(url, {headers: 
  //       {
  //       "Authorization": `Bearer ${token}`,
  //       "Content-Type": "application/json",
  //       "Accept": "application/json"
  //       }
  //   }).then((res) => {
  //       // console.log(res);
  //       if(res.data.status == false) {
  //       localStorage.removeItem("token");
  //       navigate("/login");
  //       } else {
  //       if(res.data.userType == "regUser") {
  //           setUser(res.data.userDetails);
  //           navigate("/posts");
  //       } else if(res.data.userType == "Lawyer") {
  //           setUser(res.data.userDetails);
  //           navigate("/attorney");
  //       }
  //       }
  //   })
  //   }, []);

    
    useEffect(() => {
      
    }, [])
  return (
    <div>
      
    </div>
  )
}

export default Posts;