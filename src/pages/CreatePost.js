import axios from 'axios';
import { useState, useEffect } from 'react'
import UserNav from '../layouts/UserNav';
import { useNavigate } from 'react-router-dom';

const CreatePost = () => {
  useEffect(() => {
    document.title = "Gavel || Create Post";
  })
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
            navigate("/create-post");
        } else if(res.data.userType == "Lawyer") {
            setUser(res.data.userDetails);
            navigate("/attorney");
        }
        }
    })
    }, []);

    const [title, setTitle] = useState("");
    const [body, setBody] = useState("");
    const [error, setError] = useState("");

    const createPost = () => {
      const urls = "https://gavell.herokuapp.com/post"
      axios.post(urls, {email: user.email, title, body}).then((res) => {
        if(res.status == false) {
          setError(res.message);
        } else {
          navigate("/dashboard");
        }
      })
    }
  return (
    <div>
        <div className='container'>
            <div className='row'>
                <div className='col-6 container'>
                  <h4 className='text-center display-4'>Create Post</h4>
                  {error && <div className='alert alert-danger text-danger text-center'>{error}</div>}
                    <input className='form-control w-100 my-2' placeholder='Title of the post' value={title} onChange={(e) => setTitle(e.target.value)} />
                    <textarea rows="5" className='form-control w-100 my-2' placeholder='Body of the message' value={body} onChange={(e) => setBody(e.target.value)} />
                    <button className='btn btn-gavel w-100' onClick={createPost}>Create Post</button>
                </div>
            </div>
        </div>
    </div>
  )
}

export default CreatePost;