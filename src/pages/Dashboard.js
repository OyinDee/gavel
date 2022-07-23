import avatar from "../user_icon.png";
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";
import UserNav from "../layouts/UserNav";
import axios from "axios";

const Dashboard = () => {
    const [user, setUser] = useState("")
    const url = "https://gavell.herokuapp.com/dashboard";
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
        // console.log(res);
        if(res.data.status == false) {
        localStorage.removeItem("token");
        navigate("/login");
        } else {
        if(res.data.userType == "regUser") {
            setUser(res.data.userDetails);
            navigate("/dashboard");
        } else if(res.data.userType == "Lawyer") {
            setUser(res.data.userDetails);
            navigate("/attorney");
        }
        }
    })
    }, []);
    // console.log(user)
  return (
    <div>
        <h4 className="text-center display-4">{user.first_name} {user.last_name}</h4>
        <p className="text-center">{user.email}</p>
    </div>
  )
}

export default Dashboard;