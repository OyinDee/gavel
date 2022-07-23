import React from 'react'

const AttPost = ({post}) => {
  return (
    <div className='d-flex justify-content-center'>
        <div className='card w-100 outline-black p-3 border-5 m-2'>
            <p className='text-center'>{post.email}</p>
            <p className='text-bold text-center' style={{fontWeight:"bolder"}}>{post.title}</p>
            <p className='text-center'>{post.body}</p>
            <button className='w-100 btn-gavel'>Pick the case</button>
        </div>
    </div>
  )
}

export default AttPost;