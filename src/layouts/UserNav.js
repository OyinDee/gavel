import { Link, useNavigate } from "react-router-dom";
import avatar from "../user_icon.png";

const UserNav = ({userData}) => {

    const navigate = useNavigate();

    const logout = () => {
        localStorage.removeItem("token");
        navigate("/");
    }
  return (
    <div>
        <nav className="navbar navbar-expand-lg navbar-dark bg-gavel">
            <div className="container-fluid">
                <Link className="navbar-brand" to="/">Gavel</Link>
                <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span className="navbar-toggler-icon"></span>
                </button>
                <div className="collapse navbar-collapse" id="navbarTogglerDemo02">
                    <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                        <li className="nav-item">
                            <Link className="nav-link" to="/dashboard">Dashboard</Link>
                        </li>
                        <li className="nav-item">
                            <Link className="nav-link" to="/dashboard/posts">Posts</Link>
                        </li>
                    </ul>
                </div>
                <div>
                    <img src={avatar} alt={userData.first_name} />
                    <button className="btn btn-outline-gavel" onClick={logout}>Logout</button>
                </div>
            </div>
        </nav>
    </div>
  )
}

export default UserNav;