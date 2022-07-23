import React from 'react'

const Post = ({post}) => {
  return (
    <div>
        <div className='card'>
            <p className='card-title'>{post.title}</p>
            <p className='card-body'>{post.body}</p>
        </div>
    </div>
  )
}

export default Post;