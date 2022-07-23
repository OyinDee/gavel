import avatar from "../user_icon.png";
import { Link } from "react-router-dom";
import UserNav from "../layouts/UserNav";

const Dashboard = ({userData}) => {
    console.log(userData);
  return (
    <div>
        <UserNav userData={userData} />
        <div>
            <h4 className="text-center">{userData.first_name} {userData.last_name}</h4>
            <p className="text-center">{userData.email}</p>
        </div>
    </div>
  )
}

export default Dashboard;