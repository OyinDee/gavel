import axios from "axios";
import { useEffect, useState } from "react";
import { Route, Routes, useNavigate } from "react-router-dom";
import About from "./pages/About";
import Attorney from "./pages/Attorney";
import Contact from "./pages/Contact";
import Dashboard from "./pages/Dashboard";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Register from "./pages/Register";
import CreatePost from "./pages/CreatePost";

const App = () => {
  const [userData, setUserData] = useState([]);
  return (
    <>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/contact" element={<Contact />} />
        <Route path="/register" element={<Register />} />
        <Route path="/login" element={<Login />} />
        {/* <Route path="/auth" element={<Auth user={setUserData} />} /> */}
        <Route path="/dashboard" element={<Dashboard />} />
          {/* <Route path="/posts" element={<Posts  />} /> */}
          <Route path="/create-post" element={<CreatePost />} />
        <Route path="/attorney" element={<Attorney  />} />
          {/* <Route path="/posts" element={<Posts />} /> */}
      </Routes>
    </>
  )
}

export default App;