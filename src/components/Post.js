import React from 'react'

const Post = ({post}) => {
  return (
    <div className='d-flex justify-content-center'>
        <div className='card w-100 outline-black p-3 border-5 m-2'>
            <p className='text-bold text-center' style={{fontWeight:"bolder"}}>{post.title}</p>
            <p className='text-center'>{post.body}</p>
        </div>
    </div>
  )
}

export default Post;