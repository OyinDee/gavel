import axios from "axios";
import { useEffect, useState } from "react";
import { Route, Routes, useNavigate } from "react-router-dom";
import Navbar from "./layouts/Navbar";
import About from "./pages/About";
import Attorney from "./pages/Attorney";
import Contact from "./pages/Contact";
import Dashboard from "./pages/Dashboard";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Register from "./pages/Register";

const App = () => {
  const [userData, setUserData] = useState([]);
  const url = "";
  const navigate = useNavigate();
  useEffect(() => {
    const token = localStorage.getItem("token");
    axios.get("http://localhost:4000/users/dashboard", {headers: 
    {
      "Authorization": `Bearer ${token}`,
      "Content-Type": "application/json",
      "Accept": "application/json"
    }
  }).then((res) => {
    if(res.data.status == true) {
      localStorage.removeItem("token");
      navigate("/login");
    } else {
      if(res.data.user == "user") {
        navigate("/user-dashboard");
      } else {
        navigate("/attorney");
      }
    }
  })
  }, []);
  return (
    <>
      <Routes>
        <Navbar />
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/contact" element={<Contact />} />
        <Route path="/register" element={<Register />} />
        <Route path="/login" element={<Login />} />
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/attorney" element={<Attorney />} />
      </Routes>
    </>
  )
}

export default App;