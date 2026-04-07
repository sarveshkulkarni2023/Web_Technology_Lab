import React from 'react'

const CardContent = (props) => {
  return (
    <div>
      <div className='absolute top-0 left-0 h-full w-full p-8 flex flex-col justify-between'>
            <h2 style={{backgroundColor:props.color}} className='bg-white text-xl font-semibold rounded-full h-12 w-12 flex justify-center items-center'>{props.index+1}</h2>
            <div>
                <h2 style={{color:props.color}} className='text-white text-5xl font-bold pb-4'>{props.title}</h2>
                <p className='text-shadow-2xs text-lg leading-relaxed text-white mb-14'>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dicta eum vel expedita exercitationem ex error quisquam optio deserunt ipsam delectus?.</p>
                <div className='flex justify-between'>
                    <button style={{borderColor:props.color}}className=' text-white font-medium px-8 py-2 rounded-full border-4'>CSI</button>
                    <button style={{color:props.color}}className=' text-white font-bold px-4 py-2 rounded-full'><i className="ri-arrow-right-line"></i></button>
                </div>
            </div>
        </div>
    </div>
  )
}

export default CardContent
