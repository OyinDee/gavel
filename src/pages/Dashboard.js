import avatar from "../user_icon.png";
import { Link } from "react-router-dom";
import UserNav from "../layouts/UserNav";

const Dashboard = ({userData}) => {
    console.log(userData);
  return (
    <div>
        <UserNav userData={userData} />
    </div>
  )
}

export default Dashboard;