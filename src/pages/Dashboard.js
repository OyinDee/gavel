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
<<<<<<< HEAD
        <p className="text-center"> <Link to="/create-post" className="btn btn-gavel" >Create Post</Link> </p>
        <div>
                {error && <div className="text-center alert alert-danger text-danger">{error}</div> }
                <div className='d-flex justify-content-center mx-auto col-6'>
                    <div className="">
                        {posts.map((val, i) => (
                    <Post key={i} post={val} />
                    ))}
                    </div>
                </div>
            </div>
=======
>>>>>>> 36aa230345551f5273b8ec186b29fcc0ef2768ce
    </div>
  )
}

export default Dashboard;