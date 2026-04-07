import React from 'react'
import CardContent from './CardContent'

const Section2 = () => {
    const events = [
        {
            img: 'https://plus.unsplash.com/premium_photo-1712956925385-a0557552ee0f?q=80&w=786&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            color: '#00C241',
            title:'Event 1',
            intro: '',
            tag: 'Satisfied'
        },
        {
            img: 'https://images.unsplash.com/photo-1614741118887-7a4ee193a5fa?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            color: '#bde0fe',
            title:'Event 2',
            intro: '',
            tag: 'UnderServed'
        },
        {
            img: 'https://images.unsplash.com/photo-1631624217902-d14c634ab17c?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            color: '#fdf0d5',
            title:'Event 3',
            intro: '',
            tag: 'Underbanked'
        },
        {
            img: 'https://images.unsplash.com/photo-1531379410502-63bfe8cdaf6f?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aWRlYXxlbnwwfHwwfHx8MA%3D%3D',
            color: '#ff002b',
            title:'Event 4',
            intro: '',
            tag: 'Underbanked'
        }
    ]
    return (
        <div className='mt-10'>
            <h1 className='text-5xl text-center font-bold pb-3 text-purple-700'>Upcoming Events</h1>
            <p className='text-2xl font-bold text-gray-500 text-center pb-10'>Connect here with Sanjivani to get Notified with the Sanjivani Club Events !!</p>
            <div className='px-20 mt-10 grid grid-cols-4 justify-items-center'>
               {events.map((event, index) => (
                    <div key={index} className='h-full shrink-0 w-80 rounded-4xl overflow-hidden relative'>
                        <img className='h-full w-full object-cover' src={event.img} alt={event.title} />
                        <CardContent index={index} title={event.title} tag={event.tag} color={event.color}/>
                    </div>
                ))}
            </div>
            <div className='pt-10 pb-10 flex justify-center gap-10'>
                <button className='border-3 border-purple-500 rounded-4xl pt-3 pb-3 pl-10 pr-10 font-bold text-2l text-purple-600'>Explore More Events</button>
                <button className='bg-purple-500 text-white rounded-4xl pt-3 pb-3 pl-10 pr-10 font-bold text-2l'>Register for Events</button>
            </div>
        </div>
    )
}

export default Section2
